import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/models/response/bank_res.dart';
import 'package:mobile_capstone_fpt/repositories/interface/bank_repo.dart';

class BankRepImpl implements BankRepo {
  @override
  Future<BankRes> getBank(String url) async {
    var result = BankRes();
    try {
      Response response = await Dio().get(
        url,
      );
      result = BankRes.bankResFromJson(jsonEncode(response.data));
    } catch (e) {
      showToastFail("Không tìm thấy Bank");
    }
    return result;
  }
}
