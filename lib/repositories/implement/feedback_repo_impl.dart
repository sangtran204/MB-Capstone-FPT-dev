import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/models/FeedBack/request/feedback_req.dart';
import 'package:mobile_capstone_fpt/repositories/interface/feedback_repo.dart';
import 'package:mobile_capstone_fpt/models/Notification/response/message_respone.dart';

class FeedbackImpl implements FeedbackRepo {
  @override
  Future<MessageResponeModel> sendFeedback(
      String url, String token, FeedbackReq req) async {
    var result = MessageResponeModel();
    try {
      Response response = await Dio().post(url,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}),
          data: req.toJson());
      result = messageResponeModelFromJson(jsonEncode(response.data));
      if (response.data["result"] == 'Send feedback success') {
        showToastSuccess("Gửi đánh giá thành công");
      }
    } on DioError catch (e) {
      showToastFail("Lỗi gửi đánh giá");
    }
    return result;
  }
}
