import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/repositories/implement/profile_repo_impl.dart';
import 'package:mobile_capstone_fpt/repositories/request/changePass_request.dart';
import 'package:mobile_capstone_fpt/repositories/request/update_profile_request.dart';
import 'package:mobile_capstone_fpt/repositories/response/message_respone.dart';
import 'package:mobile_capstone_fpt/repositories/response/profile_respone.dart';

class ProfileProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();

  ProfileResponeModel info = ProfileResponeModel();
  MessageResponeModel msg = MessageResponeModel();
  void getProfile(BuildContext context) async {
    String accessToken = await secureStorage.readSecureData('token');
    ProfileRepoImpl()
        .getProfile(RestApi.profileMyPath, accessToken)
        .then((value) {
      info = value;
      log(info.toJson().toString());
    });
    notifyListeners();
  }

  void updateProfile(BuildContext context, _fullName, _dob, _email) async {
    String accessToken = await secureStorage.readSecureData('token');
    ProfileRepoImpl()
        .updateProfile(
            RestApi.updateProfile,
            ProfileRequestModel(fullName: _fullName, dob: _dob, email: _email),
            accessToken)
        .then((value) {
      msg = value;
    });
    notifyListeners();
  }

  void changePassword(BuildContext context, _oldPassword, _newPassword) async {
    String accessToken = await secureStorage.readSecureData('token');
    ProfileRepoImpl()
        .changePassword(
            RestApi.changePassword,
            ChangePasswordReqModel(
                oldPassword: _oldPassword, newPassword: _newPassword),
            accessToken)
        .then((value) {
      msg = value;
      Navigator.pushReplacementNamed(context, '/profile');
    });
    notifyListeners();
  }
}
