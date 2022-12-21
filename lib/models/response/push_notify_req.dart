// To parse this JSON data, do
//
//     final pushNotifyReq = pushNotifyReqFromJson(jsonString);

import 'dart:convert';

class PushNotifyReq {
  PushNotifyReq({
    this.deviceToken,
  });

  String? deviceToken;

  factory PushNotifyReq.fromJson(Map<String, dynamic> json) => PushNotifyReq(
        deviceToken: json["deviceToken"],
      );

  Map<String, dynamic> toJson() => {
        "deviceToken": deviceToken,
      };
  static PushNotifyReq pushNotifyReqFromJson(String str) =>
      PushNotifyReq.fromJson(json.decode(str));

  static String pushNotifyReqToJson(PushNotifyReq data) =>
      json.encode(data.toJson());
}
