import 'dart:convert';

class BaseResponseMsg {
  BaseResponseMsg({
    this.result,
    this.statusCode,
  });

  String? result;
  int? statusCode;

  factory BaseResponseMsg.fromJson(Map<String, dynamic> json) =>
      BaseResponseMsg(
        result: json["result"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "statusCode": statusCode,
      };
  static BaseResponseMsg bankResFromJson(String str) =>
      BaseResponseMsg.fromJson(json.decode(str));

  String bankResToJson(BaseResponseMsg data) => json.encode(data.toJson());
}
