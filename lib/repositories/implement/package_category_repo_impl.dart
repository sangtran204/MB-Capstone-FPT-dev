import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/repositories/package_category_repo.dart';
import 'package:mobile_capstone_fpt/repositories/response/package_categories_res_model.dart';

class PackageCategoryRepoImpl implements PackageCategoryRepo {
  @override
  Future<PackageCategoryRes> getPackageCategory(
      String url, String token) async {
    var result = PackageCategoryRes();
    try {
      Response response = await Dio().get(url,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
      result = PackageCategoryRes.packageCategoryResponeModelFromJson(
          jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }
}
