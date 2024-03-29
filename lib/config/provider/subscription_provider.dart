import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/models/Subscription/request/create_sub_req.dart';
import 'package:mobile_capstone_fpt/models/Subscription/response/sub_detail_res.dart';
import 'package:mobile_capstone_fpt/models/Subscription/response/sub_history_res.dart';
import 'package:mobile_capstone_fpt/models/Subscription/response/sub_id_res.dart';
import 'package:mobile_capstone_fpt/repositories/implement/subscription_impl.dart';

class SubscriptionProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();
  void submitDataSub(BuildContext context, int totalPrice,
      DateTime subscriptionDate, String packageId) async {
    final data = CreateSubReq(
        totalPrice: totalPrice,
        subscriptionDate: subscriptionDate,
        packageId: packageId);
    // log("hihi");
    // log(data.toJson().toString());
    final accessToken = await secureStorage.readSecureData("token");
    SubRepImpl()
        .postSub(RestApi.createSub, data, accessToken)
        .then((value) async {
      secureStorage.writeSecureData("idSubscription", value.result!.id);
      showToastSuccess("Đã chọn gói");
      await Navigator.pushReplacementNamed(context, '/SchedulePage');
    }).onError((error, stackTrace) {
      // showToastFail("Chọn gói thất bại");
      Navigator.pushNamedAndRemoveUntil(context, "/HomePage", (route) => false);
    });
  }

  SubHistoryRes sub = SubHistoryRes();
  void getSubByStatus(BuildContext context, String status) async {
    String accessToken = await secureStorage.readSecureData("token");
    SubRepImpl()
        .getSubByStatus('${RestApi.getSubByStatus}$status', accessToken)
        .then((value) async {
      sub = value;
      Navigator.pushReplacementNamed(context, '/History');
      notifyListeners();
    });
  }

  void deleteSub(BuildContext context, String id) async {
    String accessToken = await secureStorage.readSecureData("token");
    SubRepImpl()
        .deleteSub('${RestApi.deleteSub}/$id', accessToken)
        .then((value) async {
      notifyListeners();
    });
  }

  void confirmSub(BuildContext context, String id) async {
    String accessToken = await secureStorage.readSecureData("token");
    SubRepImpl()
        .confirmSub('${RestApi.confirmSub}/$id', accessToken)
        .then((value) async {
      notifyListeners();
    });
  }

  SubIdRes subByID = SubIdRes();
  getSubById(BuildContext context, String id) async {
    String accessToken = await secureStorage.readSecureData("token");
    SubRepImpl()
        .getSubByID('${RestApi.getSubById}/$id', accessToken)
        .then((value) async {
      subByID = value;
      notifyListeners();
    });
  }

  void cancelSub(BuildContext context, String id) async {
    String accessToken = await secureStorage.readSecureData("token");
    SubRepImpl()
        .cancelSub('${RestApi.cancelSub}/$id', accessToken)
        .then((value) async {
      notifyListeners();
    });
  }

  SubDetailRes subDetail = SubDetailRes();
  void getSubDetail(BuildContext context, String id) async {
    String accessToken = await secureStorage.readSecureData("token");
    SubRepImpl()
        .getSubDetail('${RestApi.getSubDetail}$id', accessToken)
        .then((value) async {
      subDetail = value;
      Navigator.pushReplacementNamed(context, '/SubTracking');
    });
  }
}
