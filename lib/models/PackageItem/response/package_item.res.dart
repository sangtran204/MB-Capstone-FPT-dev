import 'dart:convert';

import 'package:mobile_capstone_fpt/models/PackageItem/entity/package_item.dart';

class PackageItemRes {
  PackageItemRes({
    this.result,
    this.statusCode,
  });

  PackageItem? result;
  int? statusCode;

  factory PackageItemRes.fromJson(Map<String, dynamic> json) => PackageItemRes(
        result: PackageItem.fromJson(json["result"]),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": result!.toJson(),
        "statusCode": statusCode,
      };

  static PackageItemRes packageItemResponeModelFromJson(String str) =>
      PackageItemRes.fromJson(json.decode(str));

  String packageItemResponeModelToJson(PackageItemRes data) =>
      json.encode(data.toJson());
}
