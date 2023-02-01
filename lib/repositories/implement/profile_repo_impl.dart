import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';

import 'package:dio/dio.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/models/Profile/request/changePass_request.dart';
import 'package:mobile_capstone_fpt/repositories/interface/profile_repo.dart';
import 'package:mobile_capstone_fpt/models/Profile/response/profile_respone.dart';
import 'package:mobile_capstone_fpt/models/Profile/request/update_profile_request.dart';
import 'package:mobile_capstone_fpt/models/Notification/response/message_respone.dart';

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

  @override
  Future<MessageResponeModel> updateProfile(
      String url, ProfileRequestModel req, String token) async {
    var result = MessageResponeModel();
    try {
      Response response = await Dio().put(url,
          data: req.toJson(),
          options: Options(
              headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
      result = messageResponeModelFromJson(jsonEncode(response.data));

      if (response.data["result"] == 'Profile update successfull') {
        showToastSuccess("Cập nhật thành công!");
      }
    } on DioError catch (e) {
      if (e.response?.data["statusCode"] == '400') {
        showToastFail("Cập nhật thất bại!");
      }
    }
    return result;
  }

  @override
  Future<MessageResponeModel> changePassword(
      String url, ChangePasswordReqModel req, String token) async {
    var result = MessageResponeModel();
    try {
      Response respone = await Dio().put(url,
          data: req.toJson(),
          options: Options(
              headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
      result = messageResponeModelFromJson(jsonEncode(respone.data));
      if (respone.data["result"] == "Change password success") {
        showToastSuccess("Cập nhật thành công!");
      }
    } on DioError catch (e) {
      if (e.response?.data["statusCode"] == '400') {
        showToastFail("Cập nhật thất bại!");
      }
    }
    return result;
  }

  @override
  Future<MessageResponeModel> updateAvatar(String url, String token,
      Map<String, dynamic> data, Map<String, File> files) async {
    var result = MessageResponeModel();
    Map<String, MultipartFile> fileMap = {};
    for (MapEntry fileEntry in files.entries) {
      File file = fileEntry.value;
      String fileName = basename(file.path);
      fileMap[fileEntry.key] = MultipartFile(
          file.openRead(), await file.length(),
          filename: fileName);
    }
    data.addAll(fileMap);
    var formData = FormData.fromMap(data);
    Response response = await Dio().put(
      url,
      options: Options(
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
          contentType: 'multipart/form-data'),
      data: formData,
    );
    result = messageResponeModelFromJson(jsonEncode(response.data));
    showToastSuccess('Cập nhật ảnh thành công');
    return result;
  }
}
