import 'package:flutter/cupertino.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/models/request/feedback_req.dart';
import 'package:mobile_capstone_fpt/repositories/implement/feedback_repo_impl.dart';
import 'package:mobile_capstone_fpt/repositories/response/message_respone.dart';

class FeedbackProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();
  Future<void> sendFeedback(BuildContext context, int _packageRate, int _foodRate,
      int _shippingRate, String _comment, String _packageId) async {
    String accessToken = await secureStorage.readSecureData("token");
    MessageResponeModel msg = MessageResponeModel();
    FeedbackImpl()
        .sendFeedback(
            RestApi.sendFeedback,
            accessToken,
            FeedbackReq(
                packageRate: _packageRate,
                foodRate: _foodRate,
                deliveryRate: _shippingRate,
                comment: _comment,
                packageId: _packageId))
        .then((value) async {
      msg = value;
      await Navigator.pushReplacementNamed(context, '/History');
      notifyListeners();
    });
  }
}
