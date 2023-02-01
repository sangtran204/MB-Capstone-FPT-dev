import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/provider/package_category_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/package_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/profile_provider.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/models/Account/request/checkExistPhone_req.dart';
import 'package:mobile_capstone_fpt/models/Account/request/forgot_password_req.dart';
import 'package:mobile_capstone_fpt/models/Account/request/register_info_req.dart';
import 'package:mobile_capstone_fpt/models/Notification/request/push_notify_req.dart';
import 'package:mobile_capstone_fpt/repositories/implement/push_notify.impl.dart';
import 'package:mobile_capstone_fpt/models/Account/request/login_request_model.dart';
import 'package:mobile_capstone_fpt/repositories/implement/auth_repo_impl.dart';
import 'package:mobile_capstone_fpt/models/Notification/response/message_respone.dart';
import 'package:mobile_capstone_fpt/view/screens.dart';
import 'package:provider/provider.dart';

class LoginProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();
  // String? _phone;
  // String? _password;
  MessageResponeModel msg = MessageResponeModel();
  // get async => null;

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
      final deviceTokenRes = await secureStorage.readSecureData("deviceToken");
      final token = await secureStorage.readSecureData("token");
      log("Device Token :");
      log(deviceTokenRes.toString());
      await PushNotifyImp()
          .pushNotify(RestApi.pushNotify, token,
              PushNotifyReq(deviceToken: deviceTokenRes))
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

  Future<void> signUp(BuildContext context, String _phone, String _fullName,
      String _dob, String _email, String _password) async {
    AuthRepoImpl()
        .signUp(
            RestApi.signUp,
            RegisterInfoReq(
                phone: _phone,
                password: _password,
                fullName: _fullName,
                dob: _dob,
                email: _email,
                address: 'customer address'))
        .then((value) async {
      if (value.result != null) {
        showToastSuccess("Chào mừng đến với Mesup");
        Navigator.pushReplacementNamed(context, '/LoginPage');
      }
    }).onError((error, stackTrace) {
      Navigator.pushReplacementNamed(context, '/');
      notifyListeners();
    });
  }

  Future<void> checkExitPhone(BuildContext context, String _phoneNumber) async {
    String _phone = _phoneNumber.toString().replaceAll('+84', '0');
    AuthRepoImpl()
        .checkPhoneRegister(
            RestApi.checkPhoneRegister, CheckExistPhoneReq(phone: _phone))
        .then((value) async {
      if (value == 'phone exist') {
        showToastFail('Số điện thoại đã tồn tại');
      }
      if (value == 'phone not exit') {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VerifyScreen(phone: _phoneNumber)));
      }
    }).onError((error, stackTrace) {
      Navigator.pushReplacementNamed(context, '/');
      notifyListeners();
    });
  }

  Future<void> checkExistPhoneReset(
      BuildContext context, String _phoneNumber) async {
    String _phone = _phoneNumber.toString().replaceAll('+84', '0');
    AuthRepoImpl()
        .checkExistPhoneReset(
            RestApi.checkPhoneResetPass, CheckExistPhoneReq(phone: _phone))
        .then((value) async {
      await secureStorage.writeSecureData('token', value.result!.accessToken);
      await secureStorage.writeSecureData(
          'customer', value.result!.refreshToken);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VerifyResetScreen(phone: _phoneNumber)));
    }).onError((error, stackTrace) {
      Navigator.pushReplacementNamed(context, '/ResetPassword');
      notifyListeners();
    });
  }

  void resetPassword(BuildContext context, String _password) async {
    String accessToken = await secureStorage.readSecureData("token");
    await AuthRepoImpl()
        .resetPassword(RestApi.forgotPassword, accessToken,
            ForgotPasswordReq(password: _password))
        .then((value) async {
      msg = value;
      await Navigator.pushReplacementNamed(context, '/LoginPage');
      notifyListeners();
    });
  }
}
