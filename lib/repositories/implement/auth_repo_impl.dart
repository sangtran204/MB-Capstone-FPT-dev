import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/models/Account/request/checkExistPhone_req.dart';
import 'package:mobile_capstone_fpt/models/Account/request/forgot_password_req.dart';
import 'package:mobile_capstone_fpt/models/Account/request/register_info_req.dart';
import 'package:mobile_capstone_fpt/models/Account/response/login_respone_model.dart';
import 'package:mobile_capstone_fpt/models/Account/request/login_request_model.dart';
import 'package:mobile_capstone_fpt/models/Account/response/register_info_res.dart';
import 'package:mobile_capstone_fpt/repositories/interface/auth_repo.dart';
import 'package:mobile_capstone_fpt/models/Notification/response/message_respone.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<LoginResponeModel> postLogIn(String url, LoginRequestModel req) async {
    var result = LoginResponeModel();
    try {
      Response response = await Dio().post(url, data: req.toJson());
      result = loginResponeModelFromJson(jsonEncode(response.data));
    } on DioError catch (e) {
      if (e.response?.data["message"] == 'Account invalid') {
        showToastFail("Số điện thoại hoặc mật khẩu không đúng!");
      }
    }
    return result;
  }

  @override
  Future logout(String url, String token) async {
    await Dio().post(url,
        options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
  }

  @override
  Future<RegisterInfoRes> signUp(String url, RegisterInfoReq req) async {
    var result = RegisterInfoRes();
    try {
      Response response = await Dio().post(url, data: req.toJson());
      result = registerInfoResFromJson(jsonEncode(response.data));
    } on DioError catch (e) {
      if (e.response?.data["message"] == 'Server error') {
        showToastFail("Lỗi hệ thống");
      }
      if (e.response?.data["message"] == 'Email existed') {
        showToastFail("Email đã tồn tại");
      }
    }
    return result;
  }

  @override
  Future<String> checkPhoneRegister(String url, CheckExistPhoneReq req) async {
    var result = LoginResponeModel();
    try {
      Response response = await Dio().post(url, data: req.toJson());
      result = loginResponeModelFromJson(jsonEncode(response.data));
      if (result.result!.accessToken.isNotEmpty) {
        return 'phone exist';
      }
    } on DioError catch (e) {
      if (e.response?.data["message"] == 'Phone not exist') {
        return 'phone not exit';
      }
    }
    return 'phone exist';
  }

  @override
  Future<LoginResponeModel> checkExistPhoneReset(
      String url, CheckExistPhoneReq req) async {
    var result = LoginResponeModel();
    try {
      Response response = await Dio().post(url, data: req.toJson());
      result = loginResponeModelFromJson(jsonEncode(response.data));
    } on DioError catch (e) {
      if (e.response?.data["message"] == 'Phone not exist') {
        showToastFail("Tài khoản không tồn tại!");
      }
      if (e.response?.data["message"] == 'This phone do not active') {
        showToastFail("Tài khoản đã bị khóa!");
      }
    }
    return result;
  }

  @override
  Future<MessageResponeModel> resetPassword(
      String url, String token, ForgotPasswordReq req) async {
    var result = MessageResponeModel();
    try {
      Response response = await Dio().put(url,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}),
          data: req.toJson());
      result = messageResponeModelFromJson(jsonEncode(response.data));
      if (response.data["result"] == 'Change password success') {
        showToastSuccess("Cập nhật mật khẩu thành công!");
      }
    } on DioError catch (e) {
      if (e.response?.data["message"] == 'Unauthorized') {
        showToastFail("Không thể đổi mật khẩu!");
      }
    }
    return result;
  }
}
