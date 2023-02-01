
// ignore_for_file: file_names

import 'dart:convert';

ChangePasswordReqModel changePasswordReqModelFromJson(String str) =>
    ChangePasswordReqModel.fromJson(json.decode(str));

String changePasswordReqModelToJson(ChangePasswordReqModel data) =>
    json.encode(data.toJson());

class ChangePasswordReqModel {
  ChangePasswordReqModel({
    this.oldPassword,
    this.newPassword,
  });

  String? oldPassword;
  String? newPassword;

  factory ChangePasswordReqModel.fromJson(Map<String, dynamic> json) =>
      ChangePasswordReqModel(
        oldPassword: json["oldPassword"],
        newPassword: json["newPassword"],
      );

  Map<String, dynamic> toJson() => {
        "oldPassword": oldPassword,
        "newPassword": newPassword,
      };
}
