import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/models/Subscription/request/create_sub_req.dart';
import 'package:mobile_capstone_fpt/models/Subscription/response/sub_cancel_res.dart';
import 'package:mobile_capstone_fpt/models/Subscription/response/sub_detail_res.dart';

import 'package:mobile_capstone_fpt/models/Subscription/response/sub_confirm_res.dart';
import 'package:mobile_capstone_fpt/models/Subscription/response/sub_delete_res.dart';

import 'package:mobile_capstone_fpt/models/Subscription/response/sub_history_res.dart';
import 'package:mobile_capstone_fpt/models/Subscription/response/sub_id_res.dart';
import 'package:mobile_capstone_fpt/models/Subscription/response/subscription_res.dart';
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
      log(e.toString());
      showToastFail("Lỗi xảy ra khi tạo Sub");
    }
    return result;
  }

  @override
  Future<ConfirmSubRes> confirmSub(String url, String accessToken) async {
    var result = ConfirmSubRes();
    try {
      Response response = await Dio().put(url,
          options: Options(headers: {
            HttpHeaders.authorizationHeader: 'Bearer $accessToken'
          }));
      result = ConfirmSubRes.confirmSubResFromJson(jsonEncode(response.data));
    } catch (e) {
      // showToastFail("Lỗi xảy ra khi xác nhận");
      log(e.toString());
    }
    return result;
  }

  @override
  Future<CancelSubRes> cancelSub(String url, String accessToken) async {
    var result = CancelSubRes();
    try {
      Response response = await Dio().put(url,
          options: Options(headers: {
            HttpHeaders.authorizationHeader: 'Bearer $accessToken'
          }));
      result = CancelSubRes.cancelSubResFromJson(jsonEncode(response.data));
      log("Hehe");
    } catch (e) {
      log(e.toString());
      // showToastFail("Lỗi xảy ra khi xác nhận");
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

  @override
  Future<SubDetailRes> getSubDetail(String url, String token) async {
    var result = SubDetailRes();
    try {
      Response response = await Dio().get(url,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
      result = SubDetailRes.subDetailResFromJson(jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }

  @override
  Future<SubIdRes> getSubByID(String url, String token) async {
    var result = SubIdRes();
    try {
      Response response = await Dio().get(url,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
      result = SubIdRes.subIdResFromJson(jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }
}
