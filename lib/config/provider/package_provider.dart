import 'package:flutter/cupertino.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/repositories/response/package_detail_respone_model.dart';
import 'package:mobile_capstone_fpt/repositories/response/package_respone_model.dart';
import 'package:mobile_capstone_fpt/repositories/implement/package_repo_impl.dart';

class PackageProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();
  PackageRes packageActive = PackageRes();

  void getPackageCustomer(BuildContext context) async {
    String accessToken = await secureStorage.readSecureData("token");
    PackageRepoImpl()
        .getActivePackage(RestApi.getActivePackage, accessToken)
        .then((value) {
      packageActive = value;
      notifyListeners();
    });
  }

  PackageDetailRes packageDetail = PackageDetailRes();
  void getPackageDetail(BuildContext context, String id) async {
    String accessToken = await secureStorage.readSecureData("token");
    PackageRepoImpl()
        .getPackageDetail('${RestApi.getDetailPackage}/$id', accessToken)
        .then((value) {
      packageDetail = value;
      notifyListeners();
      Navigator.pushReplacementNamed(context, '/packageDetail');
    });
  }
}
