import 'package:mobile_capstone_fpt/models/request/checkExistPhone_req.dart';
import 'package:mobile_capstone_fpt/models/request/forgot_password_req.dart';
import 'package:mobile_capstone_fpt/models/request/login_request_model.dart';
import 'package:mobile_capstone_fpt/models/request/register_info_req.dart';
import 'package:mobile_capstone_fpt/models/response/login_respone_model.dart';
import 'package:mobile_capstone_fpt/models/response/register_info_res.dart';
import 'package:mobile_capstone_fpt/repositories/response/message_respone.dart';

abstract class AuthRepo {
  Future<LoginResponeModel> postLogIn(String url, LoginRequestModel req);
  Future logout(String url, String token);
  Future<RegisterInfoRes> signUp(String url, RegisterInfoReq req);
  Future<String> checkPhoneRegister(String url, CheckExistPhoneReq req);
  Future<LoginResponeModel> checkExistPhoneReset(
      String url, CheckExistPhoneReq req);
  Future<MessageResponeModel> resetPassword(
      String url, String token, ForgotPasswordReq req);
}
