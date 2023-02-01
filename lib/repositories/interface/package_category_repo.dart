import 'package:mobile_capstone_fpt/models/PackageCategory/response/package_categories_res_model.dart';

abstract class PackageCategoryRepo {
  Future<PackageCategoryRes> getPackageCategory(String url, String token);
}
