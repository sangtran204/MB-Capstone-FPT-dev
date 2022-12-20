// import 'dart:convert';

class CreateOrderReq {
  CreateOrderReq({
    this.deliveryDate,
    this.priceFood,
    this.nameFood,
    this.subscriptionId,
    this.packageItemId,
    this.foodId,
    this.stationId,
    this.timeSlotId,
    this.itemCode,
    this.imageFood,
    this.foodGroupId,
    this.timeSlotFlag,
  });

  DateTime? deliveryDate;
  int? priceFood;
  String? nameFood;
  String? subscriptionId;
  String? packageItemId;
  String? foodId;
  String? stationId;
  String? timeSlotId;
  int? itemCode;
  String? imageFood;
  String? foodGroupId;
  int? timeSlotFlag;

  // factory CreateOrderReq.fromJson(Map<String, dynamic> json) => CreateOrderReq(
  //       deliveryDate: DateTime.parse(json["deliveryDate"]),
  //       priceFood: json["priceFood"],
  //       nameFood: json["nameFood"],
  //       subscriptionId: json["subscriptionID"],
  //       packageItemId: json["packageItemID"],
  //       foodId: json["foodID"],
  //       stationId: json["stationID"],
  //       timeSlotId: json["timeSlotID"],
  //       foodGroupId: json["foodGroupID"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       // "deliveryDate": deliveryDate,
  //       "deliveryDate":
  //           "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
  //       "priceFood": priceFood,
  //       "nameFood": nameFood,
  //       "subscriptionID": subscriptionId,
  //       "packageItemID": packageItemId,
  //       "foodID": foodId,
  //       "stationID": stationId,
  //       "timeSlotID": timeSlotId,
  //       "foodGroupID": foodGroupId,
  //     };
  // static CreateOrderReq createSubResFromJson(String str) =>
  //     CreateOrderReq.fromJson(json.decode(str));

  // String createSubResToJson(CreateOrderReq data) => json.encode(data.toJson());
}
