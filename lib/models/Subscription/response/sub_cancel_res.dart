import 'dart:convert';

class CancelSubRes {
  CancelSubRes({
    this.result,
    this.statusCode,
  });

  String? result;
  int? statusCode;

  factory CancelSubRes.fromJson(Map<String, dynamic> json) => CancelSubRes(
        result: json["result"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "statusCode": statusCode,
      };
  static CancelSubRes cancelSubResFromJson(String str) =>
      CancelSubRes.fromJson(json.decode(str));

  String cancelSubResToJson(CancelSubRes data) => json.encode(data.toJson());
}
