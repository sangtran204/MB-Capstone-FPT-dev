// To parse this JSON data, do
//
//     final messageResponeModel = messageResponeModelFromJson(jsonString);
import 'dart:convert';

MessageResponeModel messageResponeModelFromJson(String str) =>
    MessageResponeModel.fromJson(json.decode(str));

String messageResponeModelToJson(MessageResponeModel data) =>
    json.encode(data.toJson());

class MessageResponeModel {
  MessageResponeModel({
    this.result,
    this.statusCode,
  });

  String? result;
  int? statusCode;

  factory MessageResponeModel.fromJson(Map<String, dynamic> json) =>
      MessageResponeModel(
        result: json["result"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "statusCode": statusCode,
      };
}
