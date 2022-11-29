import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/models/request/create_sub_req.dart';
import 'package:mobile_capstone_fpt/repositories/implement/subscription_impl.dart';

class SubscriptionProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();
  void submitDataSub(
      int totalPrice, DateTime startDelivery, String packageId) async {
    final data = CreateSubReq(
        totalPrice: totalPrice,
        startDelivery: startDelivery,
        packageId: packageId);
    final accessToken = await secureStorage.readSecureData("token");
    SubRepImpl()
        .postSub(RestApi.createSub, data, accessToken)
        .then((value) async {
      log(value.result!.id);
      secureStorage.writeSecureData("idSubscription", value.result!.id);
      showToastSuccess("Tạo Sub thành công");
    }).onError((error, stackTrace) {
      showToastFail("Tạo Fail");
      log(error.toString());
    });
  }
}
