// To parse this JSON data, do
//
//     final forgotPasswordReq = forgotPasswordReqFromJson(jsonString);

import 'dart:convert';

ForgotPasswordReq forgotPasswordReqFromJson(String str) =>
    ForgotPasswordReq.fromJson(json.decode(str));

String forgotPasswordReqToJson(ForgotPasswordReq data) =>
    json.encode(data.toJson());

class ForgotPasswordReq {
  ForgotPasswordReq({
    required this.password,
  });

  String password;

  factory ForgotPasswordReq.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordReq(
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
      };
}
