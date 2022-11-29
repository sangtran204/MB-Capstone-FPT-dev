import 'dart:convert';

class CreateSubReq {
  CreateSubReq({
    required this.totalPrice,
    required this.startDelivery,
    required this.packageId,
  });

  int totalPrice;
  DateTime startDelivery;
  String packageId;

  factory CreateSubReq.fromJson(Map<String, dynamic> json) => CreateSubReq(
        totalPrice: json["totalPrice"],
        startDelivery: DateTime.parse(json["startDelivery"]),
        packageId: json["packageId"],
      );

  Map<String, dynamic> toJson() => {
        "totalPrice": totalPrice,
        "startDelivery":
            "${startDelivery.year.toString().padLeft(4, '0')}-${startDelivery.month.toString().padLeft(2, '0')}-${startDelivery.day.toString().padLeft(2, '0')}",
        "packageId": packageId,
      };

  static CreateSubReq createSubReqFromJson(String str) =>
      CreateSubReq.fromJson(json.decode(str));

  String createSubReqToJson(CreateSubReq data) => json.encode(data.toJson());
}
