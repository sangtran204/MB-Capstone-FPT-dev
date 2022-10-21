import 'package:mobile_capstone_fpt/apis/path_api.dart';

class RestApi {
  static const String signInPath = '$serverPath/auths/login/customer';
  static const String getActivePackage = '$serverPath/packages/active';
  static const String getDetailPackage = '$serverPath/packages/find';
  static const String getCategoryPackage = '$serverPath/package-categories';
  static const String pushNotify = '$serverPath/accounts/deviceToken';
  static const String profileMyPath = '$serverPath/profiles/my';
  static const String getPackageItemById = '$serverPath/package-item';
  static const String getFoodGroupDetail = '$serverPath/food-groups/find';
  //something
}
