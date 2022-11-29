import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/repositories/interface/package_item.repo.dart';
import 'package:mobile_capstone_fpt/models/response/package_item.res.dart';

class PackageItemRepoImpl implements PackageItemRepo {
  @override
  Future<PackageItemRes> getPackageItemById(String url, String token) async {
    var result = PackageItemRes();
    try {
      Response response = await Dio().get(url,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
      result = PackageItemRes.packageItemResponeModelFromJson(
          jsonEncode(response.data));
    } on DioError catch (e) {
      // if (e.response?.data["message"] == "Dont't have resource") {
        showToastFail("Không tìm thấy gói ăn!");
      // }
    }
    return result;
  }
}// class PackageRepoImpl implements 