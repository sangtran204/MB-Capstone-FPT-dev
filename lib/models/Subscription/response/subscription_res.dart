import 'dart:convert';

class CreateSubRes {
  CreateSubRes({
    this.result,
    this.statusCode,
  });

  Result? result;
  int? statusCode;

  factory CreateSubRes.fromJson(Map<String, dynamic> json) => CreateSubRes(
        result: Result.fromJson(json["result"]),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
        "statusCode": statusCode,
      };
  static CreateSubRes createSubResFromJson(String str) =>
      CreateSubRes.fromJson(json.decode(str));

  String createSubResToJson(CreateSubRes data) => json.encode(data.toJson());
}

class Result {
  Result({
    required this.id,
    required this.totalPrice,
    // required this.startDelivery,
    // required this.cancelDate,
    required this.status,
    required this.packages,
  });

  String id;
  int totalPrice;
  // DateTime startDelivery;
  // dynamic cancelDate;
  String status;
  Packages packages;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        totalPrice: json["totalPrice"],
        // startDelivery: DateTime.parse(json["startDelivery"]),
        // cancelDate: json["cancelDate"],
        status: json["status"],
        packages: Packages.fromJson(json["packages"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "totalPrice": totalPrice,
        // "startDelivery":
        //     "${startDelivery.year.toString().padLeft(4, '0')}-${startDelivery.month.toString().padLeft(2, '0')}-${startDelivery.day.toString().padLeft(2, '0')}",
        // "cancelDate": cancelDate,
        "status": status,
        "packages": packages.toJson(),
      };
}

class Packages {
  Packages({
    required this.id,
    required this.startSale,
    required this.endSale,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.totalDate,
    required this.totalMeal,
    required this.status,
  });

  String id;
  DateTime startSale;
  DateTime endSale;
  String name;
  String description;
  int price;
  String image;
  int totalDate;
  int totalMeal;
  String status;

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
        "startSale": startSale.toIso8601String(),
        "endSale": endSale.toIso8601String(),
        "name": name,
        "description": description,
        "price": price,
        "image": image,
        "totalDate": totalDate,
        "totalMeal": totalMeal,
        "status": status,
      };
}
