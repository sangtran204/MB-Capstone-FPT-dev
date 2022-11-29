import 'dart:convert';

import 'package:mobile_capstone_fpt/models/entity/time_slot.dart';

class TimeSlotRes {
  TimeSlotRes({
    this.result,
    this.statusCode,
  });

  List<TimeSlot>? result;
  int? statusCode;

  factory TimeSlotRes.fromJson(Map<String, dynamic> json) => TimeSlotRes(
        result: List<TimeSlot>.from(
            json["result"].map((x) => TimeSlot.fromJson(x))),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
        "statusCode": statusCode,
      };

  static TimeSlotRes timeSlotFromJson(String str) =>
      TimeSlotRes.fromJson(json.decode(str));

  String timeSlotToJson(TimeSlotRes data) => json.encode(data.toJson());
}
