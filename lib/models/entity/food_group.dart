class FoodGroup {
  FoodGroup({
    required this.id,
    required this.name,
    required this.description,
    required this.totalFood,
    required this.status,
    // this.foods,
  });

  String id;
  String name;
  String description;
  int totalFood;
  String status;
  // List<Food>? foods;

  factory FoodGroup.fromJson(Map<String, dynamic> json) => FoodGroup(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        totalFood: json["totalFood"],
        status: json["status"],
        // foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "totalFood": totalFood,
        "status": status,
        // "foods": List<dynamic>.from(foods!.map((x) => x.toJson())),
      };
}
