// import 'dart:developer';

// import 'package:flutter/cupertino.dart';
// import 'package:mobile_capstone_fpt/apis/rest_api.dart';
// import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
// import 'package:mobile_capstone_fpt/models/request/create_order_req.dart';
// import 'package:mobile_capstone_fpt/repositories/implement/order_repo_impl.dart';

// class OrderProvider with ChangeNotifier {
//   final SecureStorage secureStorage = SecureStorage();
//   void submitDataOrder(
//     DateTime deliveryDate,
//     int priceFood,
//     String nameFood,
//     String subscriptionId,
//     String packageItemId,
//     String foodId,
//     String stationId,
//     String timeSlotId,
//   ) async {
//     final accessToken = await secureStorage.readSecureData("token");
//     final dataCreateOrder = CreateOrderReq(
//         deliveryDate: deliveryDate,
//         priceFood: priceFood,
//         nameFood: nameFood,
//         subscriptionId: subscriptionId,
//         packageItemId: packageItemId,
//         foodId: foodId,
//         stationId: stationId,
//         timeSlotId: timeSlotId);
//     OrderRepImpl()
//         .postOrder(RestApi.createOrder, dataCreateOrder, accessToken)
//         .then((value) async {
//       log("Create thành công Order hehe");
//     }).onError((error, stackTrace) {
//       log(error.toString());
//     });
//   }
// }
