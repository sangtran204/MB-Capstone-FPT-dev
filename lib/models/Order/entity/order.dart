import 'dart:convert';

class Order {
  Order({
    this.subscriptionID,
    this.packageItemID,
    this.stationID,
    this.timeSlotID,
  });

  String? subscriptionID;
  String? packageItemID;
  String? stationID;
  String? timeSlotID;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        subscriptionID: json["subscriptionID"],
        packageItemID: json["packageItemID"],
        stationID: json["stationID"],
        timeSlotID: json["timeSlotID"],
      );

  Map<String, dynamic> toJson() => {
        "subscriptionID": subscriptionID,
        "packageItemID": packageItemID,
        "stationID": stationID,
        "timeSlotID": timeSlotID,
      };
  static Order orderFromJson(String str) => Order.fromJson(json.decode(str));

  String orderToJson(Order data) => json.encode(data.toJson());
}
