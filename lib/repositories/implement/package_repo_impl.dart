import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/models/packages/package_detail_respone_model.dart';
import 'package:mobile_capstone_fpt/models/packages/package_respone_model.dart';
import 'package:mobile_capstone_fpt/repositories/package_repo.dart';

class PackageRepoImpl implements PackageRepo {
  @override
  Future<PackageResponeModel> getActivePackage(String url) async {
    var result = PackageResponeModel();
    try {
      Response response = await Dio().get(url);
      result = packageResponeModelFromJson(jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }

  @override
  Future<PackageDetailResponeModel> getPackageDetail(
      String url) async {
    var result = PackageDetailResponeModel();
    try {
      Response response = await Dio().get(url);
      result = packageDetailResponeModelFromJson(jsonEncode(response.data));
      print(response);
    } on DioError catch (e) {
      if (e.response?.data["message"] == "Dont't have resource") {
        showToastFail("Không tìm thấy gói ăn!");
      }
    }
    return result;
  }
}// class PackageRepoImpl implements 