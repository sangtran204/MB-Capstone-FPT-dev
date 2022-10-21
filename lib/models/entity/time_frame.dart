class TimeFrame {
  TimeFrame({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.dateFilter,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String dateFilter;

  factory TimeFrame.fromJson(Map<String, dynamic> json) => TimeFrame(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        name: json["name"],
        dateFilter: json["dateFilter"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "name": name,
        "dateFilter": dateFilter,
      };
}
