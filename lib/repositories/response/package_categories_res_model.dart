// To parse this JSON data, do
//
//     final packageCategoryResponeModel = packageCategoryResponeModelFromJson(jsonString);

import 'dart:convert';

PackageCategoryResponeModel packageCategoryResponeModelFromJson(String str) =>
    PackageCategoryResponeModel.fromJson(json.decode(str));

String packageCategoryResponeModelToJson(PackageCategoryResponeModel data) =>
    json.encode(data.toJson());

class PackageCategoryResponeModel {
  PackageCategoryResponeModel({
    this.result,
    this.statusCode,
  });

  List<CategoryResult>? result;
  int? statusCode;

  factory PackageCategoryResponeModel.fromJson(Map<String, dynamic> json) =>
      PackageCategoryResponeModel(
        result:
            List<CategoryResult>.from(json["result"].map((x) => CategoryResult.fromJson(x))),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
        "statusCode": statusCode,
      };
}

class CategoryResult {
  CategoryResult({
    required this.image,
    required this.name,
    required this.id,
  });

  String image;
  String name;
  String id;

  factory CategoryResult.fromJson(Map<String, dynamic> json) => CategoryResult(
        image: json["image"],
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "id": id,
      };
}
