import 'package:flutter/cupertino.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/repositories/implement/package_item_repo.dart';
import 'package:mobile_capstone_fpt/repositories/response/package_item.res.dart';

class PackageItemProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();

  PackageItemRes packageItem = PackageItemRes();
  void getPackageItemById(BuildContext context, String id) async {
    String accessToken = await secureStorage.readSecureData("token");
    PackageItemRepoImpl()
        .getPackageItemById('${RestApi.getPackageItemById}/$id', accessToken)
        .then((value) {
      packageItem = value;
      notifyListeners();
    });
  }
}
