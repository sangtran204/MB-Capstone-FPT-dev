import 'package:mobile_capstone_fpt/models/FoodGroup/entity/food_group.dart';

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
  FoodGroup? foodGroup;

  factory PackageItem.fromJson(Map<String, dynamic> json) => PackageItem(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deliveryDate: DateTime.parse(json["deliveryDate"]),
        itemCode: json["itemCode"],
        foodGroup: FoodGroup.fromJson(json["foodGroup"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deliveryDate":
            "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
        "itemCode": itemCode,
        "foodGroup": foodGroup!.toJson(),
      };
}
