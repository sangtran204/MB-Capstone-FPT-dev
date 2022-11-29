import 'dart:convert';

class CreateSubRes {
  CreateSubRes({
    required this.deliveryDate,
    required this.priceFood,
    required this.nameFood,
    required this.subscriptionId,
    required this.packageItemId,
    required this.foodId,
    required this.stationId,
    required this.timeSlotId,
  });

  DateTime deliveryDate;
  int priceFood;
  String nameFood;
  String subscriptionId;
  String packageItemId;
  String foodId;
  String stationId;
  String timeSlotId;

  factory CreateSubRes.fromJson(Map<String, dynamic> json) => CreateSubRes(
        deliveryDate: DateTime.parse(json["deliveryDate"]),
        priceFood: json["priceFood"],
        nameFood: json["nameFood"],
        subscriptionId: json["subscriptionID"],
        packageItemId: json["packageItemID"],
        foodId: json["foodID"],
        stationId: json["stationID"],
        timeSlotId: json["timeSlotID"],
      );

  Map<String, dynamic> toJson() => {
        "deliveryDate": deliveryDate,
            // "${deliveryDate.year.toString().padLeft(4, '0')}-${deliveryDate.month.toString().padLeft(2, '0')}-${deliveryDate.day.toString().padLeft(2, '0')}",
        "priceFood": priceFood,
        "nameFood": nameFood,
        "subscriptionID": subscriptionId,
        "packageItemID": packageItemId,
        "foodID": foodId,
        "stationID": stationId,
        "timeSlotID": timeSlotId,
      };
  static CreateSubRes createSubResFromJson(String str) =>
      CreateSubRes.fromJson(json.decode(str));

  String createSubResToJson(CreateSubRes data) => json.encode(data.toJson());
}
