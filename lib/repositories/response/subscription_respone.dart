import 'dart:convert';

import 'package:mobile_capstone_fpt/models/entity/subscription-history.dart';

class SubscriptionResponeModel {
  SubscriptionResponeModel({
    this.result,
    this.statusCode,
  });

  List<Subscription>? result;
  int? statusCode;

  factory SubscriptionResponeModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionResponeModel(
        result:
            List<Subscription>.from(json["result"].map((x) => Subscription.fromJson(x))),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
        "statusCode": statusCode,
      };
  static SubscriptionResponeModel subscriptionResponeModelFromJson(
          String str) =>
      SubscriptionResponeModel.fromJson(json.decode(str));

  String subscriptionResponeModelToJson(SubscriptionResponeModel data) =>
      json.encode(data.toJson());
}
