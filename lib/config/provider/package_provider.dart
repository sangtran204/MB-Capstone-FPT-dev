import 'package:flutter/cupertino.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/models/packages/package_respone_model.dart';
import 'package:mobile_capstone_fpt/repositories/implement/package_repo_impl.dart';

class PackageProvider with ChangeNotifier {
  PackageResponeModel packageActive = PackageResponeModel();
  void getPackageCustomer(BuildContext context) {
    PackageRepoImpl().getActivePackage(RestApi.getActivePackage).then((value) {
      packageActive = value;
      notifyListeners();
    });
  }
}
