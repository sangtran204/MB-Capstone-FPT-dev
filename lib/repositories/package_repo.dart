import 'package:mobile_capstone_fpt/repositories/response/package_detail_respone_model.dart';
import 'package:mobile_capstone_fpt/repositories/response/package_respone_model.dart';

abstract class PackageRepo {
  Future<PackageRes> getActivePackage(String url, String token);
  Future<PackageDetailRes> getPackageDetail(String url, String token);
}
