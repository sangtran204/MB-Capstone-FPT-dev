import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/models/request/create_sub_req.dart';
import 'package:mobile_capstone_fpt/models/response/sub_delete_res.dart';
import 'package:mobile_capstone_fpt/models/response/sub_history_res.dart';
import 'package:mobile_capstone_fpt/models/response/subscription_res.dart';
import 'package:mobile_capstone_fpt/repositories/interface/sub_repo.dart';

class SubRepImpl implements SubRepo {
  @override
  Future<CreateSubRes> postSub(
      String url, CreateSubReq req, String accessToken) async {
    var result = CreateSubRes();
    try {
      Response response = await Dio().post(url,
          data: req.toJson(),
          options: Options(headers: {
            HttpHeaders.authorizationHeader: 'Bearer $accessToken'
          }));
      result = CreateSubRes.createSubResFromJson(jsonEncode(response.data));
    } catch (e) {
      showToastFail("Lỗi xảy ra khi tạo");
    }
    return result;
  }

  @override
  Future<SubHistoryRes> getSubByStatus(String url, String token) async {
    var result = SubHistoryRes();
    try {
      Response response = await Dio().get(url,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
      result = subHistoryResFromJson(jsonEncode(response.data));
    } on DioError catch (e) {
      if (e.response?.data["message"] == 'Don not have resource Sub') {
        showToastFail("Bạn chưa có đơn đặt hàng nào!");
      }
    }
    return result;
  }

  @override
  Future<DeleteSubRes> deleteSub(String url, String token) async {
    var result = DeleteSubRes();
    try {
      Response response = await Dio().delete(url,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
      result = DeleteSubRes.deleteSubResFromJson(jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }
}
