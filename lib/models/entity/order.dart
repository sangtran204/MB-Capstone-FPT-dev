import 'dart:convert';

class Order {
  Order({
    this.deliveryDate,
    this.priceFood,
    this.nameFood,
    this.subscriptionId,
    this.packageItemId,
    this.foodId,
    this.stationId,
    this.timeSlotId,
  });

  DateTime? deliveryDate;
  int? priceFood;
  String? nameFood;
  String? subscriptionId;
  String? packageItemId;
  String? foodId;
  String? stationId;
  String? timeSlotId;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
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
        "deliveryDate":
            "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
        "priceFood": priceFood,
        "nameFood": nameFood,
        "subscriptionID": subscriptionId,
        "packageItemID": packageItemId,
        "foodID": foodId,
        "stationID": stationId,
        "timeSlotID": timeSlotId,
      };
  static Order orderFromJson(String str) =>
      Order.fromJson(json.decode(str));

  String orderToJson(Order data) =>
      json.encode(data.toJson());
}
