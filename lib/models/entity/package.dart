import 'package:mobile_capstone_fpt/models/entity/package_category.dart';
import 'package:mobile_capstone_fpt/models/response/package_respone_model.dart';

class Package {
  Package({
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
    this.packageCategory,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime startSale;
  DateTime endSale;
  String name;
  String description;
  int price;
  String image;
  int totalDate;
  int totalFood;
  int totalMeal;
  int totalStation;
  String status;
  TimeFrame? timeFrame;
  PackageCategory? packageCategory;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
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
        timeFrame: json["timeFrame"] != null
            ? TimeFrame.fromJson(json["timeFrame"])
            : json["timeFrame"],
        packageCategory: json["packageCategory"] != null
            ? PackageCategory.fromJson(json["packageCategory"])
            : json["packageCategory"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "startSale":
            "${startSale.year.toString().padLeft(4, '0')}-${startSale.month.toString().padLeft(2, '0')}-${startSale.day.toString().padLeft(2, '0')}",
        "endSale":
            "${endSale.year.toString().padLeft(4, '0')}-${endSale.month.toString().padLeft(2, '0')}-${endSale.day.toString().padLeft(2, '0')}",
        "name": name,
        "description": description,
        "price": price,
        "image": image,
        "totalDate": totalDate,
        "totalFood": totalFood,
        "totalMeal": totalMeal,
        "totalStation": totalStation,
        "status": status,
        "timeFrame": timeFrame!.toJson(),
        "packageCategory": packageCategory!.toJson(),
      };
}
