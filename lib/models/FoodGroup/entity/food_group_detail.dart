import 'package:mobile_capstone_fpt/models/Food/entity/food.dart';

class FoodGroupDetail {
  FoodGroupDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    this.foods,
  });

  String id;
  String name;
  String description;
  String status;
  List<Food>? foods;

  factory FoodGroupDetail.fromJson(Map<String, dynamic> json) =>
      FoodGroupDetail(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        status: json["status"],
        foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "status": status,
        "foods": List<dynamic>.from(foods!.map((x) => x.toJson())),
      };
}
