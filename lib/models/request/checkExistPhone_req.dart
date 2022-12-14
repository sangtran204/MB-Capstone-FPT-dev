// To parse this JSON data, do
//
//     final checkExistPhoneReq = checkExistPhoneReqFromJson(jsonString);

import 'dart:convert';

CheckExistPhoneReq checkExistPhoneReqFromJson(String str) =>
    CheckExistPhoneReq.fromJson(json.decode(str));

String checkExistPhoneReqToJson(CheckExistPhoneReq data) =>
    json.encode(data.toJson());

class CheckExistPhoneReq {
  CheckExistPhoneReq({
    required this.phone,
  });

  String phone;

  factory CheckExistPhoneReq.fromJson(Map<String, dynamic> json) =>
      CheckExistPhoneReq(
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
      };
}
