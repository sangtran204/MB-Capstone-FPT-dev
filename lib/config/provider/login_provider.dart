import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/provider/package_category_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/package_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/profile_provider.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/models/response/push_notify_req.dart';
import 'package:mobile_capstone_fpt/repositories/implement/push_notify.impl.dart';
import 'package:mobile_capstone_fpt/models/request/login_request_model.dart';
import 'package:mobile_capstone_fpt/repositories/implement/auth_repo_impl.dart';
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
    ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    AuthRepoImpl()
        .postLogIn(
            RestApi.signInPath,
            // LoginRequestModel(phone: _phone, password: _password))
            LoginRequestModel(phone: _phone, password: _password))
        .then((value) async {
      await secureStorage.writeSecureData('token', value.result!.accessToken);
      await secureStorage.writeSecureData(
          'customer', value.result!.refreshToken);
      final deviceToken = await secureStorage.readSecureData("deviceToken");
      final token = await secureStorage.readSecureData("token");
      await PushNotifyImp()
          .pushNotify(
              RestApi.pushNotify, token, PushNotifyReq(token: deviceToken))
          .then((value) => log(value.toString()));
      // await UsersMeRepImpl()
      //     .getUsersMe(UrlApi.usersMePath, value.result!.accessToken);
      profileProvider.getProfile(context);
      packageCategoryProvider.getPackageCategory(context);
      packageProvider.getPackageCustomer(context);
      showToastSuccess("Chào mừng đến với Mesup");
      Navigator.pushReplacementNamed(context, '/HomePage');
    }).onError((error, stackTrace) {
      Navigator.pushReplacementNamed(context, '/');
      notifyListeners();
    });
  }

  Future<void> logout(BuildContext context) async {
    try {
      String accessToken = await secureStorage.readSecureData("token");
      AuthRepoImpl().logout(RestApi.logout, accessToken);
      secureStorage.deleteAll();
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
}
