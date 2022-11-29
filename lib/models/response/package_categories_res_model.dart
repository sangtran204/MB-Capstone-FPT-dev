import 'dart:convert';

import 'package:mobile_capstone_fpt/models/entity/package_category.dart';

class PackageCategoryRes {
  PackageCategoryRes({
    this.result,
    this.statusCode,
  });

  List<PackageCategory>? result;
  int? statusCode;

  factory PackageCategoryRes.fromJson(Map<String, dynamic> json) =>
      PackageCategoryRes(
        result: List<PackageCategory>.from(
            json["result"].map((x) => PackageCategory.fromJson(x))),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
        "statusCode": statusCode,
      };
  static PackageCategoryRes packageCategoryResponeModelFromJson(String str) =>
      PackageCategoryRes.fromJson(json.decode(str));

  String packageCategoryResponeModelToJson(PackageCategoryRes data) =>
      json.encode(data.toJson());
}
