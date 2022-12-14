// To parse this JSON data, do
//
//     final registerInfoReq = registerInfoReqFromJson(jsonString);

import 'dart:convert';

RegisterInfoReq registerInfoReqFromJson(String str) =>
    RegisterInfoReq.fromJson(json.decode(str));

String registerInfoReqToJson(RegisterInfoReq data) =>
    json.encode(data.toJson());

class RegisterInfoReq {
  RegisterInfoReq({
    required this.phone,
    required this.password,
    required this.fullName,
    required this.dob,
    required this.email,
    required this.address,
  });

  String phone;
  String password;
  String fullName;
  String dob;
  String email;
  String address;

  factory RegisterInfoReq.fromJson(Map<String, dynamic> json) =>
      RegisterInfoReq(
        phone: json["phone"],
        password: json["password"],
        fullName: json["fullName"],
        dob: json["DOB"],
        email: json["email"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "password": password,
        "fullName": fullName,
        "DOB": dob,
        "email": email,
        "address": address,
      };
}
