import 'package:mobile_capstone_fpt/models/PackageItem/response/package_item.res.dart';

abstract class PackageItemRepo {
  Future<PackageItemRes> getPackageItemById(String url, String token);
}
