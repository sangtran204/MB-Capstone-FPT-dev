import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/repositories/interface/food_group_repo.dart';
import 'package:mobile_capstone_fpt/models/FoodGroup/response/food_group.res.dart';

class FoodGroupRepoImpl implements FoodGroupRepo {
  @override
  Future<FoodGroupDetailRes> getFoodGroupDetail(
      String url, String token) async {
    var result = FoodGroupDetailRes();
    try {
      Response response = await Dio().get(url,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
      result = FoodGroupDetailRes.foodGroupDetailResponeModelFromJson(
          jsonEncode(response.data));
    } on DioError {
      showToastFail("Không tìm thấy!");
    }
    return result;
  }
}// class PackageRepoImpl implements 