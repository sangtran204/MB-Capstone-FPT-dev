import 'dart:convert';

import 'package:mobile_capstone_fpt/models/Package/entity/package.dart';

class PackageRes {
  PackageRes({
    this.result,
    this.statusCode,
  });

  List<Package>? result;
  int? statusCode;

  factory PackageRes.fromJson(Map<String, dynamic> json) => PackageRes(
        result:
            List<Package>.from(json["result"].map((x) => Package.fromJson(x))),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
        "statusCode": statusCode,
      };

  static PackageRes packageResponeModelFromJson(String str) =>
      PackageRes.fromJson(json.decode(str));

  String packageResponeModelToJson(PackageRes data) =>
      json.encode(data.toJson());
}

class TimeFrame {
  TimeFrame({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.dateFilter,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String dateFilter;

  factory TimeFrame.fromJson(Map<String, dynamic> json) => TimeFrame(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        name: json["name"],
        dateFilter: json["dateFilter"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "name": name,
        "dateFilter": dateFilter,
      };
}
