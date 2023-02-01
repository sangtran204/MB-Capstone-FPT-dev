import 'package:mobile_capstone_fpt/models/Subscription/request/create_sub_req.dart';
import 'package:mobile_capstone_fpt/models/Subscription/response/sub_cancel_res.dart';
import 'package:mobile_capstone_fpt/models/Subscription/response/sub_detail_res.dart';
import 'package:mobile_capstone_fpt/models/Subscription/response/sub_confirm_res.dart';
import 'package:mobile_capstone_fpt/models/Subscription/response/sub_delete_res.dart';
import 'package:mobile_capstone_fpt/models/Subscription/response/sub_history_res.dart';
import 'package:mobile_capstone_fpt/models/Subscription/response/sub_id_res.dart';
import 'package:mobile_capstone_fpt/models/Subscription/response/subscription_res.dart';

abstract class SubRepo {
  Future<CreateSubRes> postSub(String url, CreateSubReq req, String token);
  Future<SubHistoryRes> getSubByStatus(String url, String token);
  Future<DeleteSubRes> deleteSub(String url, String token);
  Future<SubDetailRes> getSubDetail(String url, String token);
  Future<ConfirmSubRes> confirmSub(String url, String token);
  Future<CancelSubRes> cancelSub(String url, String token);
  Future<SubIdRes> getSubByID(String url, String token);
}
