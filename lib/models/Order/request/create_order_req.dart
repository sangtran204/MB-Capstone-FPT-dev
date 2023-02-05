// import 'dart:convert';

class CreateOrderReq {
  CreateOrderReq({
    this.deliveryDate,
    // this.priceFood,
    this.nameFood,
    this.subscriptionId,
    this.packageItemId,
    // this.foodId,
    this.stationId,
    this.timeSlotId,
    this.itemCode,
    this.imageFood,
    this.foodGroupId,

  });

  DateTime? deliveryDate;
  // int? priceFood;
  String? nameFood;
  String? subscriptionId;
  String? packageItemId;
  // String? foodId;
  String? stationId;
  String? timeSlotId;
  int? itemCode;
  String? imageFood;
  String? foodGroupId;
}
