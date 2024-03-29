import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/models/Package/response/package_detail_respone_model.dart';
// import 'package:mobile_capstone_fpt/models/response/package_detail_respone_model.dart';
import 'package:mobile_capstone_fpt/models/Package/response/package_food_res.dart';
import 'package:mobile_capstone_fpt/models/Package/response/package_respone_model.dart';
import 'package:mobile_capstone_fpt/repositories/interface/package_repo.dart';

class PackageRepoImpl implements PackageRepo {
  @override
  Future<PackageRes> getActivePackage(String url, String token) async {
    var result = PackageRes();
    try {
      Response response = await Dio().get(url,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
      result =
          PackageRes.packageResponeModelFromJson(jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }

  @override
  Future<PackageDetailRes> getPackageDetail(String url, String token) async {
    var result = PackageDetailRes();
    try {
      Response response = await Dio().get(url,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
      result = PackageDetailRes.packageDetailResponeModelFromJson(
          jsonEncode(response.data));
    } on DioError catch (e) {
      if (e.response?.data["message"] == "Dont't have resource") {
        showToastFail("Không tìm thấy gói ăn!");
      }
    }
    return result;
  }

  @override
  Future<PackageFoodRes> getListFoodOfPackage(String url, String token) async {
    var result = PackageFoodRes();
    try {
      Response response = await Dio().get(url,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
      result = PackageFoodRes.packageFoodResFromJson(jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail("Không tìm thấy thức ăn trong gói!");
    }
    return result;
  }

  @override
  Future<PackageRes> getPackageByCategory(String url, String token) async {
    var result = PackageRes();
    try {
      Response response = await Dio().get(url,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
      result =
          PackageRes.packageResponeModelFromJson(jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }
}// class PackageRepoImpl implements 