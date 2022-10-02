import 'dart:convert';

PackageResponeModel packageResponeModelFromJson(String str) => PackageResponeModel.fromJson(json.decode(str));

String packageResponeModelToJson(PackageResponeModel data) => json.encode(data.toJson());

class PackageResponeModel {
    PackageResponeModel({
        required this.result,
        required this.statusCode,
    });

    List<Result> result;
    int statusCode;

    factory PackageResponeModel.fromJson(Map<String, dynamic> json) => PackageResponeModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        statusCode: json["statusCode"],
    );

    Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
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
        this.timeFrame,
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
    dynamic timeFrame;

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
        timeFrame: json["timeFrame"],
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
        "timeFrame": timeFrame,
    };
}
