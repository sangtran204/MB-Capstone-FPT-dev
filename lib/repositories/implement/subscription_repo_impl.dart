import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/repositories/interface/subcription-repo.dart';
import 'package:mobile_capstone_fpt/repositories/response/subscription_respone.dart';

class SubscriptionImpl implements SubscriptionRepo {
  @override
  Future<SubscriptionResponeModel> getSubByStatus(
      String url, String token) async {
    var result = SubscriptionResponeModel();
    try {
      Response response = await Dio().get(url,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
      result = SubscriptionResponeModel.subscriptionResponeModelFromJson(
          jsonEncode(response.data));
      // log('---------------check------------');
      // log(result.toJson().toString());
    } on DioError catch (e) {
      if (e.response?.data["message"] == "Don't have resource Sub") {
        showToastFail("Không có gói đăng ký");
      }
    }
    return result;
  }
}
