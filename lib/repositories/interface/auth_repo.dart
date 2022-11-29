import 'package:mobile_capstone_fpt/models/request/login_request_model.dart';
import 'package:mobile_capstone_fpt/models/response/login_respone_model.dart';

abstract class AuthRepo {
  Future<LoginResponeModel> postLogIn(String url, LoginRequestModel req);
  Future logout(String url, String token);
}
