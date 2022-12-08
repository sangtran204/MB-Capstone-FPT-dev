import 'package:mobile_capstone_fpt/apis/path_api.dart';

class RestApi {
  static const String signInPath = '$serverPath/auths/login/customer';
  static const String getPackageByCategory = '$serverPath/packages/byCategory';
  static const String getActivePackage = '$serverPath/packages/active';
  // static const String getActivePackage =
  //     '$serverPath/byStatus?statusPackage=active';
  static const String getDetailPackage = '$serverPath/packages/find';
  static const String getPackageFood =
      '$serverPath/foods/food-onPackage?packageId=';
  static const String getCategoryPackage =
      '$serverPath/package-categories/hasPackage';
  static const String pushNotify = '$serverPath/accounts/deviceToken';
  static const String profileMyPath = '$serverPath/accounts/me';
  static const String updateProfile = '$serverPath/profiles';
  static const String getPackageItemById = '$serverPath/package-item';
  static const String getFoodGroupDetail = '$serverPath/food-groups/find';
  //Post Sub, Order
  static const String createSub = '$serverPath/subscriptions';
  static const String getTimeSlot = '$serverPath/time-slots';
  static const String getTimeSlotByFlag = '$serverPath/time-slots';
  static const String getStationActive =
      '$serverPath/stations/byStatus?status=active';
  static const String createOrder = '$serverPath/orders';
  // Get list Bank
  static const String getListBank = '$serverPath/banks';
  //Post Order ====================================================
  static const String getSubPaymentUrl = '$serverPath/subscriptions';
  //
  static const String logout = '$serverPath/auths/logout';
  static const String changePassword = '$serverPath/accounts/changePassword';
  static const String updateAvatar = '$serverPath/profiles/avatar';
  // static const String getSubByStatus =
  //     '$serverPath/subscriptions/customer/getSubscription?status=';
  //something
}
