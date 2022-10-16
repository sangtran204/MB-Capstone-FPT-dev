import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/provider/package_category_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/package_provider.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/models/request/push_notify_req.dart';
import 'package:mobile_capstone_fpt/repositories/implement/push_notify.impl.dart';
import 'package:mobile_capstone_fpt/repositories/request/login_request_model.dart';
import 'package:mobile_capstone_fpt/repositories/implement/auth_repo_impl.dart';
import 'package:mobile_capstone_fpt/repositories/implement/package_repo_impl.dart';
import 'package:provider/provider.dart';

class LoginProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();
  // String? _phone;
  // String? _password;

  get async => null;

  void submitData(BuildContext context, _phone, _password) {
    PackageProvider packageProvider =
        Provider.of<PackageProvider>(context, listen: false);
    PackageCategoryProvider packageCategoryProvider =
        Provider.of<PackageCategoryProvider>(context, listen: false);
    log(_phone + ' : ' + _password);
    AuthRepoImpl()
        .postLogIn(RestApi.signInPath,
            LoginRequestModel(phone: _phone, password: _password))
        .then((value) async {
      await secureStorage.writeSecureData('token', value.result!.accessToken);
      await secureStorage.writeSecureData(
          'customer', value.result!.refreshToken);
      final deviceToken = await secureStorage.readSecureData("deviceToken");
      final token = await secureStorage.readSecureData("token");
      // await PushNotifyImp()
      //     .pushNotify(
      //         RestApi.pushNotify, token, PushNotifyReq(token: deviceToken))
      //     .then((value) => log(value.toString()));
      // await UsersMeRepImpl()
      //     .getUsersMe(UrlApi.usersMePath, value.result!.accessToken);
      packageProvider.getPackageCustomer(context);
      packageCategoryProvider.getPackageCategory(context);
      
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const ButtonBar();
      }));
      await Navigator.pushReplacementNamed(context, '/home');
    }).onError((error, stackTrace) {
      Navigator.pushReplacementNamed(context, '/');
      log(error.toString());
      notifyListeners();
    });
  }
}
