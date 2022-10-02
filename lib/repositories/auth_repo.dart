import 'package:mobile_capstone_fpt/models/auths/login_request_model.dart';
import 'package:mobile_capstone_fpt/models/auths/login_respone_model.dart';

abstract class AuthRepo {
  Future<LoginResponeModel> postLogIn(String url, LoginRequestModel req);
}
