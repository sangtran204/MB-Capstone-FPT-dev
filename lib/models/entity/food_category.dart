class FoodCategory {
  FoodCategory({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory FoodCategory.fromJson(Map<String, dynamic> json) => FoodCategory(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
