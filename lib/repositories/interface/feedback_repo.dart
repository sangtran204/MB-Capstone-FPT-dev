import 'package:mobile_capstone_fpt/models/FeedBack/request/feedback_req.dart';
import 'package:mobile_capstone_fpt/models/Notification/response/message_respone.dart';

abstract class FeedbackRepo {
  Future<MessageResponeModel> sendFeedback(
      String url, String token, FeedbackReq req);
}
