import 'package:mobile_capstone_fpt/models/request/create_sub_req.dart';
import 'package:mobile_capstone_fpt/models/response/subscription_res.dart';

abstract class SubRepo {
  Future<CreateSubRes> postSub(String url, CreateSubReq req, String token);
}
