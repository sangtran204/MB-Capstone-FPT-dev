import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/repositories/package_category_repo.dart';
import 'package:mobile_capstone_fpt/repositories/response/package_categories_res_model.dart';

class PackageCategoryRepoImpl implements PackageCategoryRepo {
  @override
  Future<PackageCategoryResponeModel> getPackageCategory(String url) async {
    var result = PackageCategoryResponeModel();
    try {
      Response response = await Dio().get(url);
      result = packageCategoryResponeModelFromJson(jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }
}
