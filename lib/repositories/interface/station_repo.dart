import 'package:mobile_capstone_fpt/models/Station/response/station_res.dart';

abstract class StationRepo {
  Future<StationRes> getStationActive(String url, String token);
}
