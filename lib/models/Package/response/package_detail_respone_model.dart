import 'dart:convert';
import 'package:mobile_capstone_fpt/models/Package/entity/package_detail.dart';

class PackageDetailRes {
  PackageDetailRes({
    this.result,
    this.statusCode,
  });

  PackageDetail? result;
  int? statusCode;

  factory PackageDetailRes.fromJson(Map<String, dynamic> json) =>
      PackageDetailRes(
        result: PackageDetail.fromJson(json["result"]),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": result!.toJson(),
        "statusCode": statusCode,
      };

  static PackageDetailRes packageDetailResponeModelFromJson(
          String str) =>
      PackageDetailRes.fromJson(json.decode(str));

  String packageDetailResponeModelToJson(PackageDetailRes data) =>
      json.encode(data.toJson());
}




