import 'package:flutter/cupertino.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/models/Station/entity/station.dart';
import 'package:mobile_capstone_fpt/repositories/implement/station_impl.dart';

class StationProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();

  List<Station>? listStationActive = [];
  void getStationActive() async {
    String accessToken = await secureStorage.readSecureData("token");
    StationRepoImpl()
        .getStationActive(RestApi.getStationActive, accessToken)
        .then((value) {
      listStationActive = value.result;
    });
    notifyListeners();
  }
}
