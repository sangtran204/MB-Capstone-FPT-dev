import 'dart:convert';

class BankRes {
  BankRes({
    this.result,
    this.statusCode,
  });

  List<Result>? result;
  int? statusCode;

  factory BankRes.fromJson(Map<String, dynamic> json) => BankRes(
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
        "statusCode": statusCode,
      };
  static BankRes bankResFromJson(String str) =>
      BankRes.fromJson(json.decode(str));

  String bankResToJson(BankRes data) => json.encode(data.toJson());
}

class Result {
  Result({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
