import 'package:mobile_capstone_fpt/repositories/request/changePass_request.dart';
import 'package:mobile_capstone_fpt/repositories/request/update_profile_request.dart';
import 'package:mobile_capstone_fpt/repositories/response/message_respone.dart';
import 'package:mobile_capstone_fpt/repositories/response/profile_respone.dart';

abstract class ProfileRepo {
  Future<ProfileResponeModel> getProfile(String url, String token);
  Future<MessageResponeModel> updateProfile(
      String url, ProfileRequestModel req, String token);
  Future<MessageResponeModel> changePassword(
      String url, ChangePasswordReqModel req, String token);
}
