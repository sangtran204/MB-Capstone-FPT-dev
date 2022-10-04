import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/models/auths/login_respone_model.dart';
import 'package:mobile_capstone_fpt/models/auths/login_request_model.dart';
import 'package:mobile_capstone_fpt/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  // AuthRepoImpl(String signInPath, LoginRequestModel loginRequestModel);

  @override
  Future<LoginResponeModel> postLogIn(String url, LoginRequestModel req) async {
    var result = LoginResponeModel();
    try {
      Response response = await Dio().post(url, data: req.toJson());
      result = loginResponeModelFromJson(jsonEncode(response.data));
      print(response);
    } on DioError catch (e) {
      log(e.toString());
      if (e.response?.data["message"] == 'Account invalid') {
        showToastFail("Số điện thoại hoặc mật khẩu không đúng!");
      }
      // showToastFail(e.response?.data["message"]);
      // showToastFail();
    }
    return result;
  }
}
