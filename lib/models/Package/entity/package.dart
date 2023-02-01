import 'package:mobile_capstone_fpt/models/PackageCategory/entity/package_category.dart';
import 'package:mobile_capstone_fpt/models/PackageItem/entity/package_item.dart';

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
    required this.totalMeal,
    required this.status,
    this.packageCategory,
    this.packageItem,
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
  int totalMeal;
  String status;
  PackageCategory? packageCategory;
  List<PackageItem>? packageItem;

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
        totalMeal: json["totalMeal"],
        status: json["status"],
        packageCategory: json["packageCategory"] != null
            ? PackageCategory.fromJson(json["packageCategory"])
            : json["packageCategory"],
        packageItem: List<PackageItem>.from(
            json["packageItem"].map((x) => PackageItem.fromJson(x))),
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
        "totalMeal": totalMeal,
        "status": status,
        "packageCategory": packageCategory!.toJson(),
        "packageItem": List<dynamic>.from(packageItem!.map((x) => x.toJson())),
      };
}
