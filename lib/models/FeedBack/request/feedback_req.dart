// To parse this JSON data, do
//
//     final feedbackReq = feedbackReqFromJson(jsonString);

import 'dart:convert';

FeedbackReq feedbackReqFromJson(String str) =>
    FeedbackReq.fromJson(json.decode(str));

String feedbackReqToJson(FeedbackReq data) => json.encode(data.toJson());

class FeedbackReq {
  FeedbackReq({
    required this.packageRate,
    required this.foodRate,
    required this.deliveryRate,
    required this.comment,
    required this.packageId,
  });

  int packageRate;
  int foodRate;
  int deliveryRate;
  String comment;
  String packageId;

  factory FeedbackReq.fromJson(Map<String, dynamic> json) => FeedbackReq(
        packageRate: json["packageRate"],
        foodRate: json["foodRate"],
        deliveryRate: json["deliveryRate"],
        comment: json["comment"],
        packageId: json["packageId"],
      );

  Map<String, dynamic> toJson() => {
        "packageRate": packageRate,
        "foodRate": foodRate,
        "deliveryRate": deliveryRate,
        "comment": comment,
        "packageId": packageId,
      };
}
