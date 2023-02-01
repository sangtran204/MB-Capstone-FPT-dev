import 'package:flutter/cupertino.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/models/TimeSlot/entity/time_slot.dart';
import 'package:mobile_capstone_fpt/repositories/implement/time_slot_impl.dart';

class TimeSlotProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();
  List<TimeSlot> listTimeSlot = [];
  List<TimeSlot> listTimeSlotByFlag = [];
  void getTimeSlot(BuildContext context) async {
    String accessToken = await secureStorage.readSecureData("token");
    TimeSlotRepoImpl()
        .getTimeSlot(RestApi.getTimeSlot, accessToken)
        .then((value) {
      listTimeSlot = value.result!;
    });
    notifyListeners();
  }
}
