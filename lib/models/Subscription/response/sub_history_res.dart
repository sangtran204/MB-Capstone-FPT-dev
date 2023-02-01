// To parse this JSON data, do
//
//     final subHistoryRes = subHistoryResFromJson(jsonString);

import 'dart:convert';

SubHistoryRes subHistoryResFromJson(String str) =>
    SubHistoryRes.fromJson(json.decode(str));

String subHistoryResToJson(SubHistoryRes data) => json.encode(data.toJson());

class SubHistoryRes {
  SubHistoryRes({
    this.result,
    this.statusCode,
  });

  List<Result>? result;
  int? statusCode;

  factory SubHistoryRes.fromJson(Map<String, dynamic> json) => SubHistoryRes(
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
        "statusCode": statusCode,
      };
}

class Result {
  Result({
    this.id,
    this.totalPrice,
    this.startDelivery,
    this.cancelDate,
    this.status,
    this.packageName,
    this.packageImg,
  });

  String? id;
  int? totalPrice;
  DateTime? startDelivery;
  dynamic cancelDate;
  String? status;
  String? packageName;
  String? packageImg;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        totalPrice: json["totalPrice"],
        startDelivery: DateTime.parse(json["startDelivery"]),
        cancelDate: json["cancelDate"],
        status: json["status"],
        packageName: json["packageName"],
        packageImg: json["packageImg"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "totalPrice": totalPrice,
        "startDelivery": startDelivery!.toIso8601String(),
        "cancelDate": cancelDate,
        "status": status,
        "packageName": packageName,
        "packageImg": packageImg,
      };
}
