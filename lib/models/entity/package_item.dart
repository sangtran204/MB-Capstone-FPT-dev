import 'package:mobile_capstone_fpt/models/entity/food_group.dart';

class PackageItem {
  PackageItem({
    required this.id,
    required this.itemCode,
    this.foodGroup,
  });

  String id;
  int itemCode;
  FoodGroup? foodGroup;

  factory PackageItem.fromJson(Map<String, dynamic> json) => PackageItem(
      id: json["id"],
      itemCode: json["itemCode"],
      foodGroup: json["foodGroup"] != null
          ? FoodGroup.fromJson(json["foodGroup"])
          : json["foodGroup"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "itemCode": itemCode,
        "foodGroup": foodGroup!.toJson(),
      };
}
