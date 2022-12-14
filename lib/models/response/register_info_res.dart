// To parse this JSON data, do
//
//     final registerInfoRes = registerInfoResFromJson(jsonString);

import 'dart:convert';

RegisterInfoRes registerInfoResFromJson(String str) =>
    RegisterInfoRes.fromJson(json.decode(str));

String registerInfoResToJson(RegisterInfoRes data) =>
    json.encode(data.toJson());

class RegisterInfoRes {
  RegisterInfoRes({
    this.result,
    this.statusCode,
  });

  Result? result;
  int? statusCode;

  factory RegisterInfoRes.fromJson(Map<String, dynamic> json) =>
      RegisterInfoRes(
        result: Result.fromJson(json["result"]),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": result!.toJson(),
        "statusCode": statusCode,
      };
}

class Result {
  Result({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.phone,
    this.password,
    this.status,
    this.refreshToken,
    this.deviceToken,
    this.confirmedVerify,
    this.codeVerify,
    this.dateExpiredVerifyCode,
    this.role,
    this.customer,
    this.profile,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? phone;
  String? password;
  String? status;
  dynamic refreshToken;
  dynamic deviceToken;
  bool? confirmedVerify;
  int? codeVerify;
  DateTime? dateExpiredVerifyCode;
  Customer? role;
  Customer? customer;
  Profile? profile;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        phone: json["phone"],
        password: json["password"],
        status: json["status"],
        refreshToken: json["refreshToken"],
        deviceToken: json["deviceToken"],
        confirmedVerify: json["confirmedVerify"],
        codeVerify: json["codeVerify"],
        dateExpiredVerifyCode: DateTime.parse(json["dateExpiredVerifyCode"]),
        role: Customer.fromJson(json["role"]),
        customer: Customer.fromJson(json["customer"]),
        profile: Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "phone": phone,
        "password": password,
        "status": status,
        "refreshToken": refreshToken,
        "deviceToken": deviceToken,
        "confirmedVerify": confirmedVerify,
        "codeVerify": codeVerify,
        "dateExpiredVerifyCode": dateExpiredVerifyCode!.toIso8601String(),
        "role": role!.toJson(),
        "customer": customer!.toJson(),
        "profile": profile!.toJson(),
      };
}

class Customer {
  Customer({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.address,
    this.name,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? address;
  String? name;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        address: json["address"] == null ? null : json["address"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "address": address == null ? null : address,
        "name": name == null ? null : name,
      };
}

class Profile {
  Profile({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.fullName,
    this.dob,
    this.avatar,
    this.email,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? fullName;
  DateTime? dob;
  dynamic? avatar;
  String? email;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        fullName: json["fullName"],
        dob: DateTime.parse(json["DOB"]),
        avatar: json["avatar"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "fullName": fullName,
        "DOB":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "avatar": avatar,
        "email": email,
      };
}
