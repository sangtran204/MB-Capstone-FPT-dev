import 'package:mobile_capstone_fpt/models/Package/response/package_detail_respone_model.dart';
import 'package:mobile_capstone_fpt/models/Package/response/package_food_res.dart';
import 'package:mobile_capstone_fpt/models/Package/response/package_respone_model.dart';

abstract class PackageRepo {
  Future<PackageRes> getActivePackage(String url, String token);
  Future<PackageDetailRes> getPackageDetail(String url, String token);
  Future<PackageRes> getPackageByCategory(String url, String token);
  Future<PackageFoodRes> getListFoodOfPackage(String url, String token);
}
