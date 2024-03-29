import 'package:mobile_capstone_fpt/config/provider/feedback_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/food_group_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/auth_provider.dart';
// import 'package:mobile_capstone_fpt/config/provider/order_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/package_category_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/package_item.dart';
import 'package:mobile_capstone_fpt/config/provider/package_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/profile_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/station_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/subscription_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/time_slot_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MainProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider<LoginProvider>(
      create: (context) => LoginProvider(),
    ),
    ChangeNotifierProvider<ProfileProvider>(
        create: (context) => ProfileProvider()),
    ChangeNotifierProvider<PackageProvider>(
        create: (context) => PackageProvider()),
    ChangeNotifierProvider<PackageCategoryProvider>(
        create: (context) => PackageCategoryProvider()),
    ChangeNotifierProvider<FoodGroupProvider>(
        create: (context) => FoodGroupProvider()),
    ChangeNotifierProvider<PackageItemProvider>(
        create: (context) => PackageItemProvider()),
    ChangeNotifierProvider<TimeSlotProvider>(
        create: (context) => TimeSlotProvider()),
    ChangeNotifierProvider<StationProvider>(
        create: (context) => StationProvider()),
    ChangeNotifierProvider<SubscriptionProvider>(
        create: (context) => SubscriptionProvider()),
    ChangeNotifierProvider<FeedbackProvider>(
        create: (context) => FeedbackProvider()),
    // ChangeNotifierProvider<OrderProvider>(create: (context) => OrderProvider()),
    // ChangeNotifierProvider<SubProvider>(
    // create: (context) => SubProvider())
  ];
}
