import 'dart:developer';
import 'package:flutter/material.dart';
// import 'package:jiffy/jiffy.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/provider/food_group_provider.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/models/Order/entity/order.dart';
import 'package:mobile_capstone_fpt/models/Package/entity/package.dart';
// import 'package:mobile_capstone_fpt/models/entity/package.dart';
import 'package:mobile_capstone_fpt/models/Package/entity/package_detail.dart';
import 'package:mobile_capstone_fpt/models/Order/request/create_order_req.dart';
import 'package:mobile_capstone_fpt/models/Package/response/package_food_res.dart';
import 'package:mobile_capstone_fpt/models/PackageItem/entity/package_item_detail.dart';
import 'package:mobile_capstone_fpt/repositories/implement/food_group_repo_impl.dart';
// import 'package:mobile_capstone_fpt/repositories/implement/food_group_repo_impl.dart';
import 'package:mobile_capstone_fpt/repositories/implement/order_repo_impl.dart';
import 'package:mobile_capstone_fpt/repositories/implement/package_repo_impl.dart';
import 'package:mobile_capstone_fpt/view/Payment%20Management/payment.dart';
import 'package:provider/provider.dart';

class PackageProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();
  PackageDetail? packageDetail;
  List<PackageItem> listPackageItem = [];
  List<String> listIdFG = [];
  List<CreateOrderReq> orderRequest = [];
  List<Result> listPackageFood = [];
  List<Order> saveDataOrder = [];

  Future<void> getPackageByCategory(BuildContext context, String id) async {
    String accessToken = await secureStorage.readSecureData("token");
    PackageRepoImpl()
        .getPackageByCategory(
            '${RestApi.getPackageByCategory}/$id', accessToken)
        .then((value) {
      listPackgeActive = value.result!;
      notifyListeners();
    });
  }

  // PackageRes packageActive = PackageRes();
  List<Package> listPackgeActive = [];
  void getPackageCustomer(BuildContext context) async {
    String accessToken = await secureStorage.readSecureData("token");
    PackageRepoImpl()
        .getActivePackage(RestApi.getActivePackage, accessToken)
        .then((value) {
      listPackgeActive = value.result!;
      notifyListeners();
    });
  }

  clearBackPackage() async {
    listPackageItem.clear();
    listIdFG.clear();
    orderRequest.clear();
    notifyListeners();
  }

  clearBackPayment() async {
    saveDataOrder.clear();
    notifyListeners();
  }

  clearBackPackageSchedule() async {
    for (var i = 0; i < orderRequest.length; i++) {
      // orderRequest[i].imageFood = null;
      // orderRequest[i].nameFood = null;
      // orderRequest[i].foodId = null;
      // orderRequest[i].priceFood = null;
      orderRequest[i].timeSlotId = null;
      orderRequest[i].stationId = null;
    }
    notifyListeners();
  }

  // int mySortComparisonItemCode(CreateOrderReq a, CreateOrderReq b) {
  //   final propertyA = a.itemCode!;
  //   final propertyB = b.itemCode!;
  //   if (propertyA < propertyB) {
  //     return -1;
  //   } else if (propertyA > propertyB) {
  //     return 1;
  //   } else {
  //     return 0;
  //   }
  // }

  int sortDate(CreateOrderReq a, CreateOrderReq b) {
    final propertyA = a.deliveryDate!;
    final propertyB = b.deliveryDate!;
    return -propertyB.compareTo(propertyA);
  }

  Future<void> getPackageDetail(BuildContext context, String id) async {
    String accessToken = await secureStorage.readSecureData("token");
    PackageRepoImpl()
        .getListFoodOfPackage('${RestApi.getPackageFood}$id', accessToken)
        .then((value) {
      listPackageFood = value.result!;
      notifyListeners();
    });
    PackageRepoImpl()
        .getPackageDetail('${RestApi.getDetailPackage}/$id', accessToken)
        .then((value) async {
      packageDetail = value.result!;
      if (packageDetail != null) {
        listPackageItem = value.result!.packageItem;
        final subscriptionId =
            await secureStorage.readSecureData("idSubscription");
        for (int index = 0; index < listPackageItem.length; index++) {
          listIdFG.add(listPackageItem[index].foodGroup!.id!);
          CreateOrderReq request = CreateOrderReq(
            foodGroupId: listPackageItem[index].foodGroup!.id,
            packageItemId: listPackageItem[index].id,
            subscriptionId: subscriptionId,
            itemCode: listPackageItem[index].itemCode,
            deliveryDate: listPackageItem[index].deliveryDate,
          );

          orderRequest.add(request);
        }
        // orderRequest.sort(mySortComparisonItemCode);
        orderRequest.sort(sortDate);

        Navigator.pushReplacementNamed(context, '/PackageDetail');
        notifyListeners();
      } else {
        showToastFail("Something when wrong ...");
      }
    });
  }

  // setFoodGroup(String indexOrderRequest, String nameFood, String idFood,
  // int priceFood, String imageFood) async {
  // final listOrderRequestTmp = [...orderRequest];
  // final index = listOrderRequestTmp
  // .indexWhere((element) => element.packageItemId == indexOrderRequest);
  // listOrderRequestTmp[index].nameFood = nameFood;
  // listOrderRequestTmp[index].foodId = idFood;
  // listOrderRequestTmp[index].priceFood = priceFood;
  // listOrderRequestTmp[index].imageFood = imageFood;
  // notifyListeners();
  // }

  // setFoodGroupRandom(String indexOrderRequest, int number) async {
  //   final listOrderRequestTmp = [...orderRequest];
  //   final index = listOrderRequestTmp
  //       .indexWhere((element) => element.packageItemId == indexOrderRequest);
  //   String accessToken = await secureStorage.readSecureData("token");
  //   final valueFood = await FoodGroupRepoImpl().getFoodGroupDetail(
  //       '${RestApi.getFoodGroupDetail}/${listOrderRequestTmp[index].foodGroupId}',
  //       // '${RestApi.getFoodGroupDetail}/${listIdFG[number]}',
  //       accessToken);
  //   if (index == 0) {
  //     listOrderRequestTmp[index].foodId = valueFood.result!.foods![1].id;
  //     listOrderRequestTmp[index].nameFood = valueFood.result!.foods![1].name;
  //     listOrderRequestTmp[index].imageFood = valueFood.result!.foods![1].image;
  //     listOrderRequestTmp[index].priceFood = valueFood.result!.foods![1].price;
  //   } else if (index == 1) {
  //     listOrderRequestTmp[index].foodId = valueFood.result!.foods![2].id;
  //     listOrderRequestTmp[index].nameFood = valueFood.result!.foods![2].name;
  //     listOrderRequestTmp[index].imageFood = valueFood.result!.foods![2].image;
  //     listOrderRequestTmp[index].priceFood = valueFood.result!.foods![2].price;
  //   } else if (index == 2) {
  //     listOrderRequestTmp[index].foodId = valueFood.result!.foods![3].id;
  //     listOrderRequestTmp[index].nameFood = valueFood.result!.foods![3].name;
  //     listOrderRequestTmp[index].imageFood = valueFood.result!.foods![3].image;
  //     listOrderRequestTmp[index].priceFood = valueFood.result!.foods![3].price;
  //   } else if (index == 3) {
  //     listOrderRequestTmp[index].foodId = valueFood.result!.foods![2].id;
  //     listOrderRequestTmp[index].nameFood = valueFood.result!.foods![2].name;
  //     listOrderRequestTmp[index].imageFood = valueFood.result!.foods![2].image;
  //     listOrderRequestTmp[index].priceFood = valueFood.result!.foods![2].price;
  //   } else {
  //     listOrderRequestTmp[index].foodId = valueFood.result!.foods![0].id;
  //     listOrderRequestTmp[index].nameFood = valueFood.result!.foods![0].name;
  //     listOrderRequestTmp[index].imageFood = valueFood.result!.foods![0].image;
  //     listOrderRequestTmp[index].priceFood = valueFood.result!.foods![0].price;
  //   }

  //   notifyListeners();
  // }

  setFoodGroupRandom(String indexOrderRequest) async {
    final listOrderRequestTmp = [...orderRequest];
    final index = listOrderRequestTmp
        .indexWhere((element) => element.packageItemId == indexOrderRequest);
    String accessToken = await secureStorage.readSecureData("token");
    final valueFood = await FoodGroupRepoImpl().getFoodGroupDetail(
        '${RestApi.getFoodGroupDetail}/${listOrderRequestTmp[index].foodGroupId}',
        // '${RestApi.getFoodGroupDetail}/${listIdFG[number]}',
        accessToken);

    // listOrderRequestTmp[index].foodId = valueFood.result!.foods![1].id;
    listOrderRequestTmp[index].nameFood = valueFood.result!.foods![0].name;
    listOrderRequestTmp[index].imageFood = valueFood.result!.foods![0].image;
    listOrderRequestTmp[index].priceFood = valueFood.result!.foods![0].price;

    notifyListeners();
  }

  setTimeSlotAndStation(String value, String indexOrderRequest, String key) {
    final listOrderRequestTmp = [...orderRequest];
    final index = listOrderRequestTmp
        .indexWhere((element) => element.packageItemId == indexOrderRequest);
    if (key == 'timeSlot') {
      listOrderRequestTmp[index].timeSlotId = value;
    } else {
      listOrderRequestTmp[index].stationId = value;
    }
    notifyListeners();
  }

  setTimeSlotAndStationRandom(String value, String key) {
    final listOrderRequestTmp = [...orderRequest];
    for (var i = 0; i < listOrderRequestTmp.length; i++) {
      final itemCode = listOrderRequestTmp[i].itemCode;
      if (key == 'timeSlotS') {
        if (itemCode == 0) {
          listOrderRequestTmp[i].timeSlotId = value;
        }
      } else if (key == 'timeSlotT') {
        if (itemCode == 1) {
          listOrderRequestTmp[i].timeSlotId = value;
        }
      } else if (key == 'timeSlotC') {
        if (itemCode == 2) {
          listOrderRequestTmp[i].timeSlotId = value;
        }
      } else {
        listOrderRequestTmp[i].stationId = value;
      }
    }
    notifyListeners();
  }

  // setTimeSlotAndStationRandom(String value, String key) {
  //   final listOrderRequestTmp = [...orderRequest];
  //   for (var i = 0; i < listOrderRequestTmp.length; i++) {
  //     final itemCode = listOrderRequestTmp[i].itemCode;
  //     if (key == 'timeSlotS') {
  //       if (itemCode == 1 ||
  //           itemCode == 4 ||
  //           itemCode == 7 ||
  //           itemCode == 10 ||
  //           itemCode == 13 ||
  //           itemCode == 16) {
  //         listOrderRequestTmp[i].timeSlotId = value;
  //       }
  //     } else if (key == 'timeSlotT') {
  //       if (itemCode == 2 ||
  //           itemCode == 5 ||
  //           itemCode == 8 ||
  //           itemCode == 11 ||
  //           itemCode == 14 ||
  //           itemCode == 17) {
  //         listOrderRequestTmp[i].timeSlotId = value;
  //       }
  //     } else if (key == 'timeSlotC') {
  //       if (itemCode == 3 ||
  //           itemCode == 6 ||
  //           itemCode == 9 ||
  //           itemCode == 12 ||
  //           itemCode == 15 ||
  //           itemCode == 18) {
  //         listOrderRequestTmp[i].timeSlotId = value;
  //       }
  //     } else {
  //       listOrderRequestTmp[i].stationId = value;
  //     }
  //   }
  //   notifyListeners();
  // }

  // submitData(BuildContext context) async {
  //   final accessToken = await secureStorage.readSecureData("token");
  //   String subId = await secureStorage.readSecureData("idSubscription");
  //   for (var element in orderRequest) {
  //     final dataCreateOrder = Order(
  //         deliveryDate: element.deliveryDate,
  //         priceFood: element.priceFood,
  //         nameFood: element.nameFood,
  //         subscriptionId: subId,
  //         packageItemId: element.packageItemId,
  //         foodId: element.foodId,
  //         stationId: element.stationId,
  //         timeSlotId: element.timeSlotId);
  //   }
  //    try {
  //       if (subId.isNotEmpty) {
  //         // rất cần cái này ===================================================
  //         await OrderRepImpl()
  //             .postOrder(RestApi.createOrder, dataCreateOrder, accessToken);
  //         log(subId.toString());
  //         final url = await OrderRepImpl().getPaymentUrl(
  //             subId, '43b02def-bf0f-4956-9b05-9f60253a5646', accessToken);
  //         Navigator.push(context,
  //             PageRouteBuilder(pageBuilder: (_, animation, __) {
  //           return FadeTransition(
  //             opacity: animation,
  //             child: PaymentPage(url: url.result!),
  //           );
  //         }));
  //       }
  //     } catch (e) {
  //       log(e.toString());
  //     }

  //   notifyListeners();
  // }

  submitData(BuildContext context) async {
    final accessToken = await secureStorage.readSecureData("token");
    String subId = await secureStorage.readSecureData("idSubscription");
    for (var element in orderRequest) {
      Order dataCreateOrder = Order(
          subscriptionID: subId,
          packageItemID: element.packageItemId,
          stationID: element.stationId,
          timeSlotID: element.timeSlotId);
      saveDataOrder.add(dataCreateOrder);
    }
    try {
      // for (var i = 0; i < saveDataOrder.length; i++) {
      //   log("vl");
      //   log(saveDataOrder[i].toJson().toString());
      // }
      if (subId.isNotEmpty) {
        // rất cần cái này ===================================================

        for (var i = 0; i < saveDataOrder.length; i++) {
          await OrderRepImpl()
              .postOrder(RestApi.createOrder, saveDataOrder[i], accessToken);
        }
        // log(subId.toString());
        final url = await OrderRepImpl().getPaymentUrl(
            subId, 'a63b58b1-5f03-4312-8002-610ca05dfa79', accessToken);
        Navigator.push(context,
            PageRouteBuilder(pageBuilder: (_, animation, __) {
          return FadeTransition(
            opacity: animation,
            child: PaymentPage(url: url.result!, listOrder: saveDataOrder),
          );
        }));
      }
    } catch (e) {
      log(e.toString());
    }

    notifyListeners();
  }
}
