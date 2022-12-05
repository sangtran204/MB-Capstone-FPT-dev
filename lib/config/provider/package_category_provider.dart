import 'package:flutter/cupertino.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/models/entity/package_category.dart';
import 'package:mobile_capstone_fpt/repositories/implement/package_category_repo_impl.dart';

class PackageCategoryProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();
  List<PackageCategory> listPackageCategory = [];
  void getPackageCategory(BuildContext context) async {
    String accessToken = await secureStorage.readSecureData("token");
    PackageCategoryRepoImpl()
        .getPackageCategory(RestApi.getCategoryPackage, accessToken)
        .then((value) {
      listPackageCategory = value.result!;
      notifyListeners();
    });
  }
}
