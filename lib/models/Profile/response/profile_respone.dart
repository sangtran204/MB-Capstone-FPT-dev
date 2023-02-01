import 'dart:convert';

import 'package:mobile_capstone_fpt/models/Profile/entity/profile_result.dart';

class ProfileResponeModel {
  ProfileResponeModel({
    this.result,
    this.statusCode,
  });

  Result? result;
  int? statusCode;

  factory ProfileResponeModel.fromJson(Map<String, dynamic> json) =>
      ProfileResponeModel(
        result: Result.fromJson(json["result"]),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": result!.toJson(),
        "statusCode": statusCode,
      };
  static ProfileResponeModel profileResponeModelFromJson(String str) =>
      ProfileResponeModel.fromJson(json.decode(str));

  String profileResponeModelToJson(ProfileResponeModel data) =>
      json.encode(data.toJson());
}
