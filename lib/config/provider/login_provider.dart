import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/models/auths/login_request_model.dart';
import 'package:mobile_capstone_fpt/repositories/implement/auth_repo_impl.dart';

class LoginProvider with ChangeNotifier {
  // String? _phone;
  // String? _password;

  get async => null;

  void submitData(BuildContext context, _phone, _password) {
    // log(_phone + ' : ' + _password);
    AuthRepoImpl()
        .postLogIn(RestApi.signInPath,
            LoginRequestModel(phone: _phone, password: _password))
        .then((value) async {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: value.result!.accessToken);
      await storage.write(key: 'ftoken', value: value.result!.refreshToken);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const ButtonBar();
      }));
      log(_password + " : " + _phone);
      await Navigator.pushReplacementNamed(context, '/home');
    }).onError((error, stackTrace) {
      Navigator.pushReplacementNamed(context, '/');
      log(error.toString());
    });
  }
}
