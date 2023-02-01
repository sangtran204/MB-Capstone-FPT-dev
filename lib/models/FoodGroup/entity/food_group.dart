class FoodGroup {
  FoodGroup({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
    this.status,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? description;
  String? status;

  factory FoodGroup.fromJson(Map<String, dynamic> json) => FoodGroup(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        name: json["name"],
        description: json["description"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "name": name,
        "description": description,
        "status": status,
      };
}
