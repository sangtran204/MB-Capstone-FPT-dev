import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/models/Order/entity/order.dart';
import 'package:mobile_capstone_fpt/models/Base/base_res.dart';
// import 'package:mobile_capstone_fpt/models/request/create_order_req.dart';
import 'package:mobile_capstone_fpt/repositories/interface/order_repo.dart';

class OrderRepImpl implements OrderRepo {
  @override
  Future<String> postOrder(String url, Order req, String accessToken) async {
    try {
      // Response response =
      await Dio().post(url,
          data: req.toJson(),
          options: Options(headers: {
            HttpHeaders.authorizationHeader: 'Bearer $accessToken'
          }));
      // result = Order.orderFromJson(jsonEncode(response.data));
      // log("Tạo ok");
    } catch (e) {
      showToastFail("Vui lòng nhập đủ thông tin");
    }
    return "Tạo Order thành công";
  }

  Future<BaseResponseMsg> getPaymentUrl(
      String id, String bankId, String accessToken) async {
    var data = BaseResponseMsg();
    try {
      String url = RestApi.getSubPaymentUrl + '/$id/payment-url?bankId=$bankId';
      Response response = await Dio().get(url,
          options: Options(headers: {
            HttpHeaders.authorizationHeader: 'Bearer $accessToken'
          }));
      data = BaseResponseMsg.fromJson(response.data);
      return data;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
