import 'dart:convert';

import 'package:mobile_capstone_fpt/models/entity/station.dart';

class StationRes {
  StationRes({
    this.result,
    this.statusCode,
  });

  List<Station>? result;
  int? statusCode;

  factory StationRes.fromJson(Map<String, dynamic> json) => StationRes(
        result:
            List<Station>.from(json["result"].map((x) => Station.fromJson(x))),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
        "statusCode": statusCode,
      };

  static StationRes stationResFromJson(String str) =>
      StationRes.fromJson(json.decode(str));

  String stationResToJson(StationRes data) => json.encode(data.toJson());
}
