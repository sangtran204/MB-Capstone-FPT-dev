// To parse this JSON data, do
//
//     final packageDetailResponeModel = packageDetailResponeModelFromJson(jsonString);

import 'dart:convert';

PackageDetailResponeModel packageDetailResponeModelFromJson(String str) => PackageDetailResponeModel.fromJson(json.decode(str));

String packageDetailResponeModelToJson(PackageDetailResponeModel data) => json.encode(data.toJson());

class PackageDetailResponeModel {
    PackageDetailResponeModel({
        this.result,
        this.statusCode,
    });

    Result? result;
    int? statusCode;

    factory PackageDetailResponeModel.fromJson(Map<String, dynamic> json) => PackageDetailResponeModel(
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
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.startSale,
        required this.endSale,
        required this.name,
        required this.description,
        required this.price,
        required this.image,
        required this.totalDate,
        required this.totalFood,
        required this.totalMeal,
        required this.totalStation,
        required this.status,
        required this.timeFrame,
    });

    String id;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime startSale;
    DateTime endSale;
    String name;
    String description;
    String price;
    String image;
    int totalDate;
    int totalFood;
    int totalMeal;
    int totalStation;
    String status;
    TimeFrame timeFrame;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        startSale: DateTime.parse(json["startSale"]),
        endSale: DateTime.parse(json["endSale"]),
        name: json["name"],
        description: json["description"],
        price: json["price"],
        image: json["image"],
        totalDate: json["totalDate"],
        totalFood: json["totalFood"],
        totalMeal: json["totalMeal"],
        totalStation: json["totalStation"],
        status: json["status"],
        timeFrame: TimeFrame.fromJson(json["timeFrame"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "startSale": "${startSale.year.toString().padLeft(4, '0')}-${startSale.month.toString().padLeft(2, '0')}-${startSale.day.toString().padLeft(2, '0')}",
        "endSale": "${endSale.year.toString().padLeft(4, '0')}-${endSale.month.toString().padLeft(2, '0')}-${endSale.day.toString().padLeft(2, '0')}",
        "name": name,
        "description": description,
        "price": price,
        "image": image,
        "totalDate": totalDate,
        "totalFood": totalFood,
        "totalMeal": totalMeal,
        "totalStation": totalStation,
        "status": status,
        "timeFrame": timeFrame.toJson(),
    };
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
    int dateFilter;

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
