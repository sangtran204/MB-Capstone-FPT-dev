import 'package:mobile_capstone_fpt/models/response/profile_respone.dart';

abstract class ProfileRepo {
  Future<ProfileResponeModel> getProfile(String url, String token);
}
