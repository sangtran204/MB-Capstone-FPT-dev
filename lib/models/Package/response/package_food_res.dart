import 'dart:convert';

class PackageFoodRes {
  PackageFoodRes({
    this.result,
    this.statusCode,
  });

  List<Result>? result;
  int? statusCode;

  factory PackageFoodRes.fromJson(Map<String, dynamic> json) => PackageFoodRes(
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
        "statusCode": statusCode,
      };
  static PackageFoodRes packageFoodResFromJson(String str) =>
      PackageFoodRes.fromJson(json.decode(str));

  String packageFoodResToJson(PackageFoodRes data) =>
      json.encode(data.toJson());
}

class Result {
  Result({
    this.id,
    this.name,
    this.image,
  });

  String? id;
  String? name;
  String? image;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
