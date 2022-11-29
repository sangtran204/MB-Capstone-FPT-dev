class Station {
  Station({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.openTime,
    required this.closeTime,
    required this.status,
  });

  String id;
  String name;
  String address;
  String phone;
  String openTime;
  String closeTime;
  String status;

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "phone": phone,
        "openTime": openTime,
        "closeTime": closeTime,
        "status": status,
      };
}
