import 'dart:io';

import 'package:mobile_capstone_fpt/models/Profile/response/profile_respone.dart';
import 'package:mobile_capstone_fpt/models/Profile/request/changePass_request.dart';
import 'package:mobile_capstone_fpt/models/Profile/request/update_profile_request.dart';
import 'package:mobile_capstone_fpt/models/Notification/response/message_respone.dart';


abstract class ProfileRepo {
  Future<ProfileResponeModel> getProfile(String url, String token);
  Future<MessageResponeModel> updateProfile(
      String url, ProfileRequestModel req, String token);
  Future<MessageResponeModel> changePassword(
      String url, ChangePasswordReqModel req, String token);
  Future<MessageResponeModel> updateAvatar(String url, String token,
      Map<String, dynamic> data, Map<String, File> files);
}
