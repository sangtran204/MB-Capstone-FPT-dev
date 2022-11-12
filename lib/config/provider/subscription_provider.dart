import 'package:flutter/cupertino.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/models/entity/subscription-history.dart';
import 'package:mobile_capstone_fpt/repositories/implement/subscription_repo_impl.dart';
import 'package:mobile_capstone_fpt/repositories/response/subscription_respone.dart';

class SubProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();
  // SubscriptionResponeModel subResInprogress = SubscriptionResponeModel();
  // SubscriptionResponeModel subResUnconfirm = SubscriptionResponeModel();
  // SubscriptionResponeModel subResDone = SubscriptionResponeModel();
  // SubscriptionResponeModel subResCancel = SubscriptionResponeModel();
  // List<Subscription> listSub = [];
  SubscriptionResponeModel subRes = SubscriptionResponeModel();
  List<Subscription> list = [];

  void getSubByInprogess(BuildContext context) async {
    String accessToken = await secureStorage.readSecureData("token");
    SubscriptionImpl()
        .getSubByStatus('${RestApi.getSubByStatus}inProgress', accessToken)
        .then((value) async {
      list = value.result!;
      // log(subRes.toJson().toString());
      await Navigator.pushReplacementNamed(context, '/history');
    });
    notifyListeners();
  }

  void getSubByStatus(BuildContext context, String status) async {
    String accessToken = await secureStorage.readSecureData("token");
    SubscriptionImpl()
        .getSubByStatus('${RestApi.getSubByStatus}$status', accessToken)
        .then((value) {
      // subRes = value;
      list = value.result!;
      // log(value.toJson().toString());
      notifyListeners();
    });
  }

  void getSubByUnConfirm(BuildContext context) async {
    String accessToken = await secureStorage.readSecureData("token");
    SubscriptionImpl()
        .getSubByStatus('${RestApi.getSubByStatus}unConfirmed', accessToken)
        .then((value) {
      list = value.result!;
      // log(value.toJson().toString());
    });
    notifyListeners();
  }
}
