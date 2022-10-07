import 'package:flutter/cupertino.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/repositories/implement/package_category_repo_impl.dart';
import 'package:mobile_capstone_fpt/repositories/response/package_categories_res_model.dart';

class PackageCategoryProvider with ChangeNotifier {
  PackageCategoryResponeModel packageCategory = PackageCategoryResponeModel();
  void getPackageCategory(BuildContext context) {
    PackageCategoryRepoImpl()
        .getPackageCategory(RestApi.getCategoryPackage)
        .then((value) {
      packageCategory = value;
      notifyListeners();
    });
  }
}
