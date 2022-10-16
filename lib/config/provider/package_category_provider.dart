import 'package:flutter/cupertino.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/repositories/implement/package_category_repo_impl.dart';
import 'package:mobile_capstone_fpt/repositories/response/package_categories_res_model.dart';

class PackageCategoryProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();
  PackageCategoryRes packageCategory = PackageCategoryRes();
  void getPackageCategory(BuildContext context) async {
    String accessToken = await secureStorage.readSecureData("token");
    PackageCategoryRepoImpl()
        .getPackageCategory(RestApi.getCategoryPackage, accessToken)
        .then((value) {
      packageCategory = value;
      notifyListeners();
    });
  }
}

