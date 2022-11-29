import 'dart:convert';

LoginRequestModel loginRequestModelFromJson(String str) => LoginRequestModel.fromJson(json.decode(str));

String loginRequestModelToJson(LoginRequestModel data) => json.encode(data.toJson());

class LoginRequestModel {
    LoginRequestModel({
        required this.phone,
        required this.password,
    });

    String phone;
    String password;

    factory LoginRequestModel.fromJson(Map<String, dynamic> json) => LoginRequestModel(
        phone: json["phone"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "phone": phone,
        "password": password,
    };
}
