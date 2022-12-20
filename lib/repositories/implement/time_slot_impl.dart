import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/repositories/interface/time_slot_repo.dart';
import 'package:mobile_capstone_fpt/models/response/time_slot.res.dart';

class TimeSlotRepoImpl implements TimeSlotRepo {
  @override
  Future<TimeSlotRes> getTimeSlot(String url, String token) async {
    var result = TimeSlotRes();
    try {
      Response response = await Dio().get(url,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
      result = TimeSlotRes.timeSlotFromJson(jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail("Không tìm thấy khung thời gian!");
    }
    return result;
  }

  @override
  Future<TimeSlotRes> getTimeSlotByFlag(String url, String token) async {
    var result = TimeSlotRes();
    try {
      Response response = await Dio().get(url,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
      result = TimeSlotRes.timeSlotFromJson(jsonEncode(response.data));
    } on DioError {
      showToastFail("Không tìm thấy khung thời gian!");
    }
    return result;
  }
}// class PackageRepoImpl implements 