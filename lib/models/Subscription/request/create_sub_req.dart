import 'dart:convert';

class CreateSubReq {
  CreateSubReq({
    required this.totalPrice,
    required this.subscriptionDate,
    required this.packageId,
  });

  int totalPrice;
  DateTime subscriptionDate;
  String packageId;

  factory CreateSubReq.fromJson(Map<String, dynamic> json) => CreateSubReq(
        totalPrice: json["totalPrice"],
        subscriptionDate: DateTime.parse(json["subscriptionDate"]),
        packageId: json["packageId"],
      );

  Map<String, dynamic> toJson() => {
        "totalPrice": totalPrice,
        "subscriptionDate":
            "${subscriptionDate.year.toString().padLeft(4, '0')}-${subscriptionDate.month.toString().padLeft(2, '0')}-${subscriptionDate.day.toString().padLeft(2, '0')}",
        "packageId": packageId,
      };

  static CreateSubReq createSubReqFromJson(String str) =>
      CreateSubReq.fromJson(json.decode(str));

  String createSubReqToJson(CreateSubReq data) => json.encode(data.toJson());
}
