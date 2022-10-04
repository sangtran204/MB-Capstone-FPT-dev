import 'package:mobile_capstone_fpt/models/packages/package_detail_respone_model.dart';
import 'package:mobile_capstone_fpt/models/packages/package_respone_model.dart';

abstract class PackageRepo {
  Future<PackageResponeModel> getActivePackage(String url);
  Future<PackageDetailResponeModel> getPackageDetail(String url);
}
