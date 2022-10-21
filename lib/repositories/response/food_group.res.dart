import 'dart:convert';
import 'package:mobile_capstone_fpt/models/entity/food_group.dart';
import 'package:mobile_capstone_fpt/models/entity/food_group_detail.dart';

class FoodGroupDetailRes {
  FoodGroupDetailRes({
    this.result,
    this.statusCode,
  });

  FoodGroupDetail? result;
  int? statusCode;

  factory FoodGroupDetailRes.fromJson(Map<String, dynamic> json) =>
      FoodGroupDetailRes(
        result: FoodGroupDetail.fromJson(json["result"]),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": result!.toJson(),
        "statusCode": statusCode,
      };

  static FoodGroupDetailRes foodGroupDetailResponeModelFromJson(
          String str) =>
      FoodGroupDetailRes.fromJson(json.decode(str));

  String foodGroupDetailResponeModelToJson(FoodGroupDetailRes data) =>
      json.encode(data.toJson());
}




