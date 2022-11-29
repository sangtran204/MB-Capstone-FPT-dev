import 'package:flutter/cupertino.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/models/entity/package.dart';
import 'package:mobile_capstone_fpt/models/entity/package_detail.dart';
// import 'package:mobile_capstone_fpt/models/entity/package_item.dart';
// import 'package:mobile_capstone_fpt/repositories/response/package_detail_respone_model.dart';
// import 'package:mobile_capstone_fpt/models/response/package_respone_model.dart';
import 'package:mobile_capstone_fpt/repositories/implement/package_repo_impl.dart';

class PackageProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();
  // getListPackageActive() async {
  //   getPackageCustomer();
  //   notifyListeners();
  // }

  // PackageRes packageActive = PackageRes();
  List<Package> listPackgeActive = [];
  // Package
  void getPackageCustomer(BuildContext context) async {
    String accessToken = await secureStorage.readSecureData("token");
    PackageRepoImpl()
        .getActivePackage(RestApi.getActivePackage, accessToken)
        .then((value) {
      listPackgeActive = value.result!;
    });
    notifyListeners();
  }

  // PackageDetailRes packageDetail = PackageDetailRes();

  PackageDetail? packageDetail;
  void getPackageDetail(BuildContext context, String id) async {
    String accessToken = await secureStorage.readSecureData("token");
    PackageRepoImpl()
        .getPackageDetail('${RestApi.getDetailPackage}/$id', accessToken)
        .then((value) {
      packageDetail = value.result!;
      if (packageDetail != null) {
        // showToastSuccess("Chuyển nhánh thành công");
        Navigator.pushReplacementNamed(context, '/PackageDetail');
      } else {
        showToastFail("Something when wrong ...");
      }
    });
    notifyListeners();
  }

  // PackageRes packageByCate = PackageRes();
  void getPackageByCategory(BuildContext context, String id) async {
    String accessToken = await secureStorage.readSecureData("token");
    PackageRepoImpl()
        .getPackageByCategory(
            '${RestApi.getPackageByCategory}/$id', accessToken)
        .then((value) {
      listPackgeActive = value.result!;
      notifyListeners();
    });
  }
}
