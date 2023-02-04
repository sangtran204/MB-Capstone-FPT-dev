// To parse this JSON data, do
//
//     final subIdRes = subIdResFromJson(jsonString);

import 'dart:convert';

class SubIdRes {
  SubIdRes({
    this.result,
    this.statusCode,
  });

  Result? result;
  int? statusCode;

  factory SubIdRes.fromJson(Map<String, dynamic> json) => SubIdRes(
        result: Result.fromJson(json["result"]),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": result!.toJson(),
        "statusCode": statusCode,
      };
  static SubIdRes subIdResFromJson(String str) =>
      SubIdRes.fromJson(json.decode(str));

  String subIdResToJson(SubIdRes data) => json.encode(data.toJson());
}

class Result {
  Result({
    this.id,
    this.totalPrice,
    this.subscriptionDate,
    this.status,
    this.packages,
    this.orders,
  });

  String? id;
  int? totalPrice;
  DateTime? subscriptionDate;
  String? status;
  Packages? packages;
  List<Order>? orders;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        totalPrice: json["totalPrice"],
        subscriptionDate: DateTime.parse(json["subscriptionDate"]),
        status: json["status"],
        packages: Packages.fromJson(json["packages"]),
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "totalPrice": totalPrice,
        "subscriptionDate":
            "${subscriptionDate!.year.toString().padLeft(4, '0')}-${subscriptionDate!.month.toString().padLeft(2, '0')}-${subscriptionDate!.day.toString().padLeft(2, '0')}",
        "status": status,
        "packages": packages!.toJson(),
        "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    this.id,
    this.status,
  });

  String? id;
  String? status;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
      };
}

class Packages {
  Packages({
    this.id,
    this.startSale,
    this.endSale,
    this.name,
    this.description,
    this.price,
    this.image,
    this.totalDate,
    this.totalMeal,
    this.status,
  });

  String? id;
  DateTime? startSale;
  DateTime? endSale;
  String? name;
  String? description;
  int? price;
  String? image;
  int? totalDate;
  int? totalMeal;
  String? status;

  factory Packages.fromJson(Map<String, dynamic> json) => Packages(
        id: json["id"],
        startSale: DateTime.parse(json["startSale"]),
        endSale: DateTime.parse(json["endSale"]),
        name: json["name"],
        description: json["description"],
        price: json["price"],
        image: json["image"],
        totalDate: json["totalDate"],
        totalMeal: json["totalMeal"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "startSale": startSale!.toIso8601String(),
        "endSale": endSale!.toIso8601String(),
        "name": name,
        "description": description,
        "price": price,
        "image": image,
        "totalDate": totalDate,
        "totalMeal": totalMeal,
        "status": status,
      };
}
