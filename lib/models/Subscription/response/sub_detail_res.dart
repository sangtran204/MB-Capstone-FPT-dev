// To parse this JSON data, do
//
//     final subDetailRes = subDetailResFromJson(jsonString);

import 'dart:convert';

class SubDetailRes {
  SubDetailRes({
    this.result,
    this.statusCode,
  });

  Result? result;
  int? statusCode;

  factory SubDetailRes.fromJson(Map<String, dynamic> json) => SubDetailRes(
        result: Result.fromJson(json["result"]),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
        "statusCode": statusCode,
      };
  static SubDetailRes subDetailResFromJson(String str) =>
      SubDetailRes.fromJson(json.decode(str));

  String subDetailResToJson(SubDetailRes data) => json.encode(data.toJson());
}

class Result {
  Result({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.totalPrice,
    this.subscriptionDate,
    // this.cancelDate,
    this.status,
    this.orders,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? totalPrice;
  DateTime? subscriptionDate;
  // dynamic cancelDate;
  String? status;
  List<Order>? orders;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        totalPrice: json["totalPrice"],
        subscriptionDate: DateTime.parse(json["subscriptionDate"]),
        // cancelDate: json["cancelDate"],
        status: json["status"],
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "totalPrice": totalPrice,
        "subscriptionDate":
            "${subscriptionDate?.year.toString().padLeft(4, '0')}-${subscriptionDate?.month.toString().padLeft(2, '0')}-${subscriptionDate?.day.toString().padLeft(2, '0')}",
        // "cancelDate": cancelDate,
        "status": status,
        "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.packageItem,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? status;
  PackageItem? packageItem;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        status: json["status"],
        packageItem: PackageItem.fromJson(json["packageItem"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "status": status,
        "packageItem": packageItem!.toJson(),
      };
}

class PackageItem {
  PackageItem({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deliveryDate,
    this.itemCode,
    this.foodGroup,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deliveryDate;
  int? itemCode;
  Food? foodGroup;

  factory PackageItem.fromJson(Map<String, dynamic> json) => PackageItem(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deliveryDate: DateTime.parse(json["deliveryDate"]),
        itemCode: json["itemCode"],
        foodGroup: Food.fromJson(json["foodGroup"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "deliveryDate":
            "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
        "itemCode": itemCode,
        "foodGroup": foodGroup!.toJson(),
      };
}

class Food {
  Food({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
    this.status,
    this.foods,
    this.price,
    this.image,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? description;
  String? status;
  List<Food>? foods;
  int? price;
  String? image;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        name: json["name"],
        description: json["description"],
        status: json["status"],
        foods: json["foods"] == null
            ? []
            : List<Food>.from(json["foods"]!.map((x) => Food.fromJson(x))),
        price: json["price"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "name": name,
        "description": description,
        "status": status,
        "foods": foods == null
            ? []
            : List<dynamic>.from(foods!.map((x) => x.toJson())),
        "price": price,
        "image": image,
      };
}
