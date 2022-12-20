import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_capstone_fpt/models/response/push_notify_req.dart';
import 'package:mobile_capstone_fpt/models/response/push_notify.res.dart';
import 'package:mobile_capstone_fpt/repositories/interface/push_notify_rep.dart';

class PushNotifyImp implements PushNotifyRepo {
  @override
  Future<PushNotifyRes> pushNotify(
      String url, String accessToken, PushNotifyReq req) async {
    var result = PushNotifyRes();
    try {
      // ignore: unused_local_variable
      Response response = await Dio().post(url,
          data: req.toJson(),
          options: Options(headers: {
            HttpHeaders.authorizationHeader: 'Bearer $accessToken'
          }));
    } catch (e) {
      log("Xui quá đi");
      log(e.toString());
    }
    return result;
  }
}
