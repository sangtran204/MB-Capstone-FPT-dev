import 'package:mobile_capstone_fpt/apis/path_api.dart';

class RestApi {
  // Auth
  static const String signInPath = '$serverPath/auths/login/customer';
  static const String checkPhoneRegister = '$serverPath/auths/checkPhone';
  static const String checkPhoneResetPass =
      '$serverPath/auths/checkPhone_customer';
  static const String forgotPassword = '$serverPath/accounts/forgotPassword';

  // Sign-up
  static const String signUp = '$serverPath/auths/sign-up/customer';

  // Logout
  static const String logout = '$serverPath/auths/logout';
  // Profile
  static const String changePassword = '$serverPath/accounts/changePassword';
  static const String updateAvatar = '$serverPath/profiles/avatar';
  static const String profileMyPath = '$serverPath/accounts/me';
  static const String updateProfile = '$serverPath/profiles';

  // Package Category
  static const String getPackageByCategory = '$serverPath/packages/byCategory';
  static const String getCategoryPackage =
      '$serverPath/package-categories/hasPackage';

  // Package
  static const String getActivePackage =
      '$serverPath/packages/byStatus?status=active';
  static const String getDetailPackage = '$serverPath/packages/find';
  static const String getPackageFood =
      '$serverPath/foods/food-onPackage?packageId=';

  // Package Item
  static const String getPackageItemById = '$serverPath/package-item';

  // Food-Group
  static const String getFoodGroupDetail = '$serverPath/food-groups/find';

  // FeedBack
  static const String sendFeedback = '$serverPath/feedback';

  // Notification
  static const String pushNotify = '$serverPath/accounts/deviceToken';

  // Time-Slot
  static const String getTimeSlot = '$serverPath/time-slots';
  static const String getTimeSlotByFlag = '$serverPath/time-slots';

  // Station
  static const String getStationActive =
      '$serverPath/stations/byStatus?status=active';

  // Bank
  static const String getListBank = '$serverPath/banks';

  //Post Order ====================================================
  static const String createOrder = '$serverPath/orders';

  //Subscription
  static const String getSubPaymentUrl = '$serverPath/subscriptions';
  static const String getSubDetail = '$serverPath/subscriptions/byCustomer/';
  static const String createSub = '$serverPath/subscriptions';
  static const String getSubByStatus =
      '$serverPath/subscriptions/customer/getSubscription?status=';
  static const String deleteSub = '$serverPath/subscriptions/delete';
  static const String confirmSub = '$serverPath/subscriptions/confirm';
  static const String cancelSub = '$serverPath/subscriptions/cancel';
  static const String getSubById = '$serverPath/subscriptions';

  //something
}
