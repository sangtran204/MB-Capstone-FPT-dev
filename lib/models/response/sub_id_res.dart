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
    this.startDelivery,
    this.cancelDate,
    this.status,
    this.packages,
    this.orders,
  });

  String? id;
  int? totalPrice;
  DateTime? startDelivery;
  dynamic cancelDate;
  String? status;
  Packages? packages;
  List<Order>? orders;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        totalPrice: json["totalPrice"],
        startDelivery: DateTime.parse(json["startDelivery"]),
        cancelDate: json["cancelDate"],
        status: json["status"],
        packages: Packages.fromJson(json["packages"]),
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "totalPrice": totalPrice,
        "startDelivery":
            "${startDelivery!.year.toString().padLeft(4, '0')}-${startDelivery!.month.toString().padLeft(2, '0')}-${startDelivery!.day.toString().padLeft(2, '0')}",
        "cancelDate": cancelDate,
        "status": status,
        "packages": packages!.toJson(),
        "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    this.id,
    this.deliveryDate,
    this.priceFood,
    this.nameFood,
    this.status,
  });

  String? id;
  DateTime? deliveryDate;
  int? priceFood;
  String? nameFood;
  String? status;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        deliveryDate: DateTime.parse(json["deliveryDate"]),
        priceFood: json["priceFood"],
        nameFood: json["nameFood"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deliveryDate":
            "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
        "priceFood": priceFood,
        "nameFood": nameFood,
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
    this.totalFood,
    this.totalStation,
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
  int? totalFood;
  int? totalStation;
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
        totalFood: json["totalFood"],
        totalStation: json["totalStation"],
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
        "totalFood": totalFood,
        "totalStation": totalStation,
        "status": status,
      };
}
