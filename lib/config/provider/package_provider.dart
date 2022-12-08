import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/provider/food_group_provider.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/models/entity/order.dart';
import 'package:mobile_capstone_fpt/models/entity/package.dart';
import 'package:mobile_capstone_fpt/models/entity/package_detail.dart';
import 'package:mobile_capstone_fpt/models/entity/package_item.dart';
import 'package:mobile_capstone_fpt/models/request/create_order_req.dart';
import 'package:mobile_capstone_fpt/models/response/package_food_res.dart';
import 'package:mobile_capstone_fpt/repositories/implement/food_group_repo_impl.dart';
import 'package:mobile_capstone_fpt/repositories/implement/order_repo_impl.dart';
import 'package:mobile_capstone_fpt/repositories/implement/package_repo_impl.dart';
import 'package:mobile_capstone_fpt/view/payment/payment.dart';

class PackageProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();
  PackageDetail? packageDetail;
  List<PackageItem> listPackageItem = [];
  List<String> listIdFG = [];
  List<CreateOrderReq> orderRequest = [];
  List<Result> listPackageFood = [];

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

  int mySortComparisonItemCode(CreateOrderReq a, CreateOrderReq b) {
    final propertyA = a.itemCode!;
    final propertyB = b.itemCode!;
    if (propertyA < propertyB) {
      return -1;
    } else if (propertyA > propertyB) {
      return 1;
    } else {
      return 0;
    }
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
          listIdFG.add(listPackageItem[index].foodGroup!.id);
          CreateOrderReq request = CreateOrderReq(
              foodGroupId: listPackageItem[index].foodGroup!.id,
              packageItemId: listPackageItem[index].id,
              subscriptionId: subscriptionId,
              itemCode: listPackageItem[index].itemCode,
              deliveryDate: findDate(listPackageItem[index].itemCode));

          orderRequest.add(request);
        }
        orderRequest.sort(mySortComparisonItemCode);

        Navigator.pushReplacementNamed(context, '/PackageDetail');
        notifyListeners();
      } else {
        showToastFail("Something when wrong ...");
      }
    });
  }

  DateTime findDate(int _itemCode) {
    late int _dayOfWeek;
    if (_itemCode == 1 || _itemCode == 2 || _itemCode == 3) {
      _dayOfWeek = 1;
    } else if (_itemCode == 4 || _itemCode == 5 || _itemCode == 6) {
      _dayOfWeek = 2;
    } else if (_itemCode == 7 || _itemCode == 8 || _itemCode == 9) {
      _dayOfWeek = 3;
    } else if (_itemCode == 10 || _itemCode == 11 || _itemCode == 12) {
      _dayOfWeek = 4;
    } else if (_itemCode == 13 || _itemCode == 14 || _itemCode == 15) {
      _dayOfWeek = 5;
    } else if (_itemCode == 16 || _itemCode == 17 || _itemCode == 18) {
      _dayOfWeek = 6;
    }
    DateTime date = DateTime.now();
    int dateOfYear = Jiffy((DateTime.now())).dayOfYear;
    int findDateOfYear = dateOfYear + 7 - (date.weekday - _dayOfWeek);
    DateTime fDate = DateTime(date.year, 1, 1);
    fDate.millisecondsSinceEpoch;
    DateTime expectedDate = DateTime.fromMillisecondsSinceEpoch(
        fDate.millisecondsSinceEpoch +
            (1000 * 60 * 60 * 24 * (findDateOfYear - 1)));
    return expectedDate;
  }

  setFoodGroup(String indexOrderRequest, String nameFood, String idFood,
      int priceFood, String imageFood) async {
    final listOrderRequestTmp = [...orderRequest];
    final index = listOrderRequestTmp
        .indexWhere((element) => element.packageItemId == indexOrderRequest);
    listOrderRequestTmp[index].nameFood = nameFood;
    listOrderRequestTmp[index].foodId = idFood;
    listOrderRequestTmp[index].priceFood = priceFood;
    listOrderRequestTmp[index].imageFood = imageFood;
    notifyListeners();
  }

  setFoodGroupRandom(String indexOrderRequest) async {
    final listOrderRequestTmp = [...orderRequest];
    final index = listOrderRequestTmp
        .indexWhere((element) => element.packageItemId == indexOrderRequest);
    String accessToken = await secureStorage.readSecureData("token");
    final valueFood = await FoodGroupRepoImpl().getFoodGroupDetail(
        '${RestApi.getFoodGroupDetail}/${listOrderRequestTmp[index].foodGroupId}',
        accessToken);

    listOrderRequestTmp[index].foodId = valueFood.result!.foods![0].id;
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
    log(value.toString());
    final listOrderRequestTmp = [...orderRequest];
    for (var i = 0; i < listOrderRequestTmp.length; i++) {
      final itemCode = listOrderRequestTmp[i].itemCode;
      if (key == 'timeSlotS') {
        if (itemCode == 1 ||
            itemCode == 4 ||
            itemCode == 7 ||
            itemCode == 10 ||
            itemCode == 13 ||
            itemCode == 16) {
          listOrderRequestTmp[i].timeSlotId = value;
        }
      } else if (key == 'timeSlotT') {
        if (itemCode == 2 ||
            itemCode == 5 ||
            itemCode == 8 ||
            itemCode == 11 ||
            itemCode == 14 ||
            itemCode == 17) {
          listOrderRequestTmp[i].timeSlotId = value;
        }
      } else if (key == 'timeSlotC') {
        if (itemCode == 3 ||
            itemCode == 6 ||
            itemCode == 9 ||
            itemCode == 12 ||
            itemCode == 15 ||
            itemCode == 18) {
          listOrderRequestTmp[i].timeSlotId = value;
        }
      } else {
        listOrderRequestTmp[i].stationId = value;
      }
    }
    for (var i = 0; i < listOrderRequestTmp.length; i++) {
      log(listOrderRequestTmp[i].toJson().toString());
    }
    notifyListeners();
  }

  submitData(BuildContext context) async {
    final accessToken = await secureStorage.readSecureData("token");
    String subId = await secureStorage.readSecureData("idSubscription");
    for (var element in orderRequest) {
      final dataCreateOrder = Order(
          deliveryDate: element.deliveryDate,
          priceFood: element.priceFood,
          nameFood: element.nameFood,
          subscriptionId: subId,
          packageItemId: element.packageItemId,
          foodId: element.foodId,
          stationId: element.stationId,
          timeSlotId: element.timeSlotId);
      try {
        await OrderRepImpl()
            .postOrder(RestApi.createOrder, dataCreateOrder, accessToken);
      } catch (e) {
        log(e.toString());
      }
    }
    if (subId.isNotEmpty) {
      final url = await OrderRepImpl().getPaymentUrl(
          subId, '43b02def-bf0f-4956-9b05-9f60253a5646', accessToken);
      Navigator.push(context, PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: PaymentPage(url: url.result!),
        );
      }));
    }
    notifyListeners();
  }
}
