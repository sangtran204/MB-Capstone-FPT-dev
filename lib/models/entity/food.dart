import 'package:mobile_capstone_fpt/models/entity/food_category.dart';

class Food {
  Food({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.status,
    this.foodCategory,
  });

  String id;
  String name;
  String description;
  int price;
  String image;
  String status;
  FoodCategory? foodCategory;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      price: json["price"],
      image: json["image"],
      status: json["status"],
      foodCategory: json["foodCategory"] != null
          ? FoodCategory.fromJson(json["foodCategory"])
          : json["foodCategory"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "image": image,
        "status": status,
        "foodCategory": foodCategory!.toJson(),
      };
}
