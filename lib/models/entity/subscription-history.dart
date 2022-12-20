// ignore_for_file: file_names

class Subscription {
  Subscription({
    required this.id,
    required this.totalPrice,
    required this.startDelivery,
    required this.cancelDate,
    required this.status,
    required this.packageName,
    required this.packageImg,
  });

  String id;
  int totalPrice;
  DateTime startDelivery;
  dynamic cancelDate;
  String status;
  String packageName;
  String packageImg;

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json["id"],
        totalPrice: json["totalPrice"],
        startDelivery: DateTime.parse(json["startDelivery"]),
        cancelDate: json["cancelDate"],
        status: json["status"],
        packageName: json["packageName"],
        packageImg: json["packageImg"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "totalPrice": totalPrice,
        "startDelivery": startDelivery.toIso8601String(),
        "cancelDate": cancelDate,
        "status": status,
        "packageName": packageName,
        "packageImg": packageImg,
      };
}