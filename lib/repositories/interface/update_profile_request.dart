import 'dart:convert';

ProfileRequestModel profileRequestModelFromJson(String str) => ProfileRequestModel.fromJson(json.decode(str));

String profileRequestModelToJson(ProfileRequestModel data) => json.encode(data.toJson());

class ProfileRequestModel {
    ProfileRequestModel({
        required this.fullName,
        required this.dob,
        required this.email,
    });

    String fullName;
    DateTime dob;
    String email;

    factory ProfileRequestModel.fromJson(Map<String, dynamic> json) => ProfileRequestModel(
        fullName: json["fullName"],
        dob: DateTime.parse(json["DOB"]),
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "DOB": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "email": email,
    };
}
