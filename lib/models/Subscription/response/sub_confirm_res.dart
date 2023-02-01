import 'dart:convert';

class ConfirmSubRes {
  ConfirmSubRes({
    this.result,
    this.statusCode,
  });

  String? result;
  int? statusCode;

  factory ConfirmSubRes.fromJson(Map<String, dynamic> json) => ConfirmSubRes(
        result: json["result"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "statusCode": statusCode,
      };
  static ConfirmSubRes confirmSubResFromJson(String str) =>
      ConfirmSubRes.fromJson(json.decode(str));

  String confirmSubResToJson(ConfirmSubRes data) => json.encode(data.toJson());
}
