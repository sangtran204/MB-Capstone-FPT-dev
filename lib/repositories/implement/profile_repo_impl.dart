import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/repositories/interface/profile_repo.dart';
import 'package:mobile_capstone_fpt/models/response/profile_respone.dart';

class ProfileRepoImpl implements ProfileRepo {
  @override
  Future<ProfileResponeModel> getProfile(String url, String token) async {
    var result = ProfileResponeModel();
    try {
      Response response = await Dio().get(url,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
      result = ProfileResponeModel.profileResponeModelFromJson(
          jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }
}
