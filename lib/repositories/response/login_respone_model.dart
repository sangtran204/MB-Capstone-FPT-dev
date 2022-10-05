import 'dart:convert';

LoginResponeModel loginResponeModelFromJson(String str) => LoginResponeModel.fromJson(json.decode(str));

String loginResponeModelToJson(LoginResponeModel data) => json.encode(data.toJson());

class LoginResponeModel {
    LoginResponeModel({
        this.result,
        this.statusCode,
    });

    Result? result;
    int? statusCode;

    factory LoginResponeModel.fromJson(Map<String, dynamic> json) => LoginResponeModel(
        result: Result.fromJson(json["result"]),
        statusCode: json["statusCode"],
    );

    Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
        "statusCode": statusCode,
    };
}

class Result {
    Result({
        required this.accessToken,
        required this.refreshToken,
    });

    String accessToken;
    String refreshToken;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
    };
}