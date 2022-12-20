import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/models/request/create_sub_req.dart';
import 'package:mobile_capstone_fpt/models/response/sub_detail_res.dart';
import 'package:mobile_capstone_fpt/models/response/sub_history_res.dart';
import 'package:mobile_capstone_fpt/repositories/implement/subscription_impl.dart';

class SubscriptionProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();
  void submitDataSub(BuildContext context, int totalPrice,
      DateTime startDelivery, String packageId) async {
    final data = CreateSubReq(
        totalPrice: totalPrice,
        startDelivery: startDelivery,
        packageId: packageId);
    final accessToken = await secureStorage.readSecureData("token");
    SubRepImpl()
        .postSub(RestApi.createSub, data, accessToken)
        .then((value) async {
      secureStorage.writeSecureData("idSubscription", value.result!.id);
      // log(value.result!.id);
      // showToastSuccess("Đã chọn gói");
      await Navigator.pushReplacementNamed(context, '/SchedulePage');
      // await Navigator.pushReplacementNamed(context, '/ChoicePage');
    }).onError((error, stackTrace) {
      // log(error.toString());
      showToastFail("Chọn gói thất bại");
      Navigator.pushNamedAndRemoveUntil(context, "/HomePage", (route) => false);
    });
  }

  //  SubscriptionResponeModel subRes = SubscriptionResponeModel();
  // List<> list = [];
  SubHistoryRes sub = SubHistoryRes();

  // void getSubByInprogess(BuildContext context) async {
  //   String accessToken = await secureStorage.readSecureData("token");
  //   SubscriptionImpl()
  //       .getSubByStatus('${RestApi.getSubByStatus}inProgress', accessToken)
  //       .then((value) async {
  //     list = value.result!;
  //     // log(subRes.toJson().toString());
  //     await Navigator.pushReplacementNamed(context, '/history');
  //   });
  //   notifyListeners();
  // }

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
  // void getSubByUnConfirm(BuildContext context) async {
  //   String accessToken = await secureStorage.readSecureData("token");
  //   SubscriptionImpl()
  //       .getSubByStatus('${RestApi.getSubByStatus}unConfirmed', accessToken)
  //       .then((value) {
  //     list = value.result!;
  //     // log(value.toJson().toString());
  //   });
  //   notifyListeners();
  // }
}
