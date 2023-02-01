import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/models/Station/response/station_res.dart';
import 'package:mobile_capstone_fpt/repositories/interface/station_repo.dart';

class StationRepoImpl implements StationRepo {
  @override
  Future<StationRes> getStationActive(String url, String token) async {
    var result = StationRes();
    try {
      Response response = await Dio().get(url,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
      result = StationRes.stationResFromJson(jsonEncode(response.data));
    } on DioError {
      showToastFail("Không tìm thấy trạm!");
    }
    return result;
  }
}// class PackageRepoImpl implements 