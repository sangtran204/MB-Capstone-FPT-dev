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
    this.startDelivery,
    this.cancelDate,
    this.status,
    this.orders,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? totalPrice;
  DateTime? startDelivery;
  dynamic cancelDate;
  String? status;
  List<Order>? orders;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        totalPrice: json["totalPrice"],
        startDelivery: DateTime.parse(json["startDelivery"]),
        cancelDate: json["cancelDate"],
        status: json["status"],
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "totalPrice": totalPrice,
        "startDelivery":
            "${startDelivery?.year.toString().padLeft(4, '0')}-${startDelivery?.month.toString().padLeft(2, '0')}-${startDelivery?.day.toString().padLeft(2, '0')}",
        "cancelDate": cancelDate,
        "status": status,
        "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deliveryDate,
    this.priceFood,
    this.nameFood,
    this.status,
    this.food,
    this.station,
    this.timeSlot,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deliveryDate;
  int? priceFood;
  String? nameFood;
  String? status;
  Food? food;
  Station? station;
  TimeSlot? timeSlot;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deliveryDate: DateTime.parse(json["deliveryDate"]),
        priceFood: json["priceFood"],
        nameFood: json["nameFood"],
        status: json["status"],
        food: Food.fromJson(json["food"]),
        station: Station.fromJson(json["station"]),
        timeSlot: TimeSlot.fromJson(json["timeSlot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deliveryDate":
            "${deliveryDate?.year.toString().padLeft(4, '0')}-${deliveryDate?.month.toString().padLeft(2, '0')}-${deliveryDate?.day.toString().padLeft(2, '0')}",
        "priceFood": priceFood,
        "nameFood": nameFood,
        "status": status,
        "food": food?.toJson(),
        "station": station?.toJson(),
        "timeSlot": timeSlot?.toJson(),
      };
}

class Food {
  Food({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
    this.price,
    this.image,
    this.status,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? description;
  int? price;
  String? image;
  String? status;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        name: json["name"],
        description: json["description"],
        price: json["price"],
        image: json["image"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "name": name,
        "description": description,
        "price": price,
        "image": image,
        "status": status,
      };
}

class Station {
  Station({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.address,
    this.phone,
    this.openTime,
    this.closeTime,
    this.status,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? address;
  String? phone;
  String? openTime;
  String? closeTime;
  String? status;

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "name": name,
        "address": address,
        "phone": phone,
        "openTime": openTime,
        "closeTime": closeTime,
        "status": status,
      };
}

class TimeSlot {
  TimeSlot({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.startTime,
    this.endTime,
    this.flag,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? startTime;
  String? endTime;
  int? flag;

  factory TimeSlot.fromJson(Map<String, dynamic> json) => TimeSlot(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        startTime: json["startTime"],
        endTime: json["endTime"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "startTime": startTime,
        "endTime": endTime,
        "flag": flag,
      };
}
