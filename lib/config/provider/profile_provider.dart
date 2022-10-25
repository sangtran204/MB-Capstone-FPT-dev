import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/repositories/implement/profile_repo_impl.dart';
import 'package:mobile_capstone_fpt/repositories/response/profile_respone.dart';

class ProfileProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();

  ProfileResponeModel info = ProfileResponeModel();
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
}
