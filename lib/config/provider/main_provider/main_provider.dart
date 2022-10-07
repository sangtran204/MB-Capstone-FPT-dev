
import 'package:mobile_capstone_fpt/config/provider/login_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/package_category_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/package_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MainProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider<LoginProvider>(
      create: (context) => LoginProvider(),
    ),
    ChangeNotifierProvider<PackageProvider>(
        create: (context) => PackageProvider()),
    ChangeNotifierProvider<PackageCategoryProvider>(
        create: (context) => PackageCategoryProvider())
  ];
}
