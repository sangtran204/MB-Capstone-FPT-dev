import 'package:mobile_capstone_fpt/repositories/response/package_categories_res_model.dart';

abstract class PackageCategoryRepo {
  Future<PackageCategoryResponeModel> getPackageCategory(String url);
}
