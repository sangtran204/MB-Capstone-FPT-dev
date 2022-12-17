import 'dart:convert';

class DeleteSubRes {
  DeleteSubRes({
    this.result,
    this.statusCode,
  });

  String? result;
  int? statusCode;

  factory DeleteSubRes.fromJson(Map<String, dynamic> json) => DeleteSubRes(
        result: json["result"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "statusCode": statusCode,
      };

  static DeleteSubRes deleteSubResFromJson(String str) =>
      DeleteSubRes.fromJson(json.decode(str));

  String deleteSubResToJson(DeleteSubRes data) => json.encode(data.toJson());
}
