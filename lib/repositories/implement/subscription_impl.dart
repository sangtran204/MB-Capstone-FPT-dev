import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/models/request/create_sub_req.dart';
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
}
