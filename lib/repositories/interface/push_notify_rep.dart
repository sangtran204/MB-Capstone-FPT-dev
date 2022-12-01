import 'package:mobile_capstone_fpt/models/response/push_notify_req.dart';
import 'package:mobile_capstone_fpt/models/response/push_notify.res.dart';

abstract class PushNotifyRepo {
  Future<PushNotifyRes> pushNotify(
      String url, String accessToken, PushNotifyReq req);
}