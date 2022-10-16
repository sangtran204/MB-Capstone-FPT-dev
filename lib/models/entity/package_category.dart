class PackageCategory {
  PackageCategory({
    required this.id,
    // required this.createdAt,
    // required this.updatedAt,
    required this.name,
    required this.image,
  });

  String id;
  // DateTime createdAt;
  // DateTime updatedAt;
  String name;
  String image;

  factory PackageCategory.fromJson(Map<String, dynamic> json) =>
      PackageCategory(
        id: json["id"],
        // createdAt: DateTime.parse(json["createdAt"]),
        // updatedAt: DateTime.parse(json["updatedAt"]),
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        // "createdAt": createdAt.toIso8601String(),
        // "updatedAt": updatedAt.toIso8601String(),
        "name": name,
        "image": image,
      };
}
