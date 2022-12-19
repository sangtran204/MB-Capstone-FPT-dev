import 'package:mobile_capstone_fpt/models/request/create_sub_req.dart';
import 'package:mobile_capstone_fpt/models/response/sub_confirm_res.dart';
import 'package:mobile_capstone_fpt/models/response/sub_delete_res.dart';
import 'package:mobile_capstone_fpt/models/response/sub_history_res.dart';
import 'package:mobile_capstone_fpt/models/response/subscription_res.dart';

abstract class SubRepo {
  Future<CreateSubRes> postSub(String url, CreateSubReq req, String token);
  Future<SubHistoryRes> getSubByStatus(String url, String token);
  Future<DeleteSubRes> deleteSub(String url, String token);
  Future<ConfirmSubRes> confirmSub(String url, String token);
}
