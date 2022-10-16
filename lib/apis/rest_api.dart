import 'package:mobile_capstone_fpt/apis/path_api.dart';

class RestApi {
  static const String signInPath = '$serverPath/auths/login/customer';
  static const String getActivePackage = '$serverPath/packages/active';
  static const String getDetailPackage = '$serverPath/packages/find-by-id';
  static const String getCategoryPackage = '$serverPath/package-categories';
  static const String pushNotify = '$serverPath/accounts/deviceToken';
  static const String profileMyPath = '$serverPath/profiles/my';
  //something
}
