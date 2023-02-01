import 'package:mobile_capstone_fpt/models/Notification/request/push_notify_req.dart';
import 'package:mobile_capstone_fpt/models/Notification/response/push_notify.res.dart';

abstract class PushNotifyRepo {
  Future<PushNotifyRes> pushNotify(
      String url, String accessToken, PushNotifyReq req);
}
