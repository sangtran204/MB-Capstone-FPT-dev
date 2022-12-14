class Result {
  Result({
    required this.id,
    required this.phone,
    required this.status,
    required this.profile,
    required this.role,
    required this.customer,
    required this.kitchen,
    required this.shipper,
  });

  String id;
  String phone;
  String status;
  Profile profile;
  Role role;
  Customer customer;
  dynamic kitchen;
  dynamic shipper;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        phone: json["phone"],
        status: json["status"],
        profile: Profile.fromJson(json["profile"]),
        role: Role.fromJson(json["role"]),
        customer: Customer.fromJson(json["customer"]),
        kitchen: json["kitchen"],
        shipper: json["shipper"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "status": status,
        "profile": profile.toJson(),
        "role": role.toJson(),
        "customer": customer.toJson(),
        "kitchen": kitchen,
        "shipper": shipper,
      };
}

class Customer {
  Customer({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.address,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String address;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "address": address,
      };
}

class Profile {
  Profile({
    required this.id,
    required this.fullName,
    required this.dob,
    required this.avatar,
    required this.email,
  });

  String id;
  String fullName;
  dynamic dob;
  dynamic avatar;
  String email;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        fullName: json["fullName"],
        dob: json["DOB"],
        avatar: json["avatar"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "DOB": dob,
        "avatar": avatar,
        "email": email,
      };
}

class Role {
  Role({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
