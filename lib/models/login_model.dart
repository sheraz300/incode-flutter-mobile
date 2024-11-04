// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  int userId;
  String email;
  String lastName;
  String firstName;
  DateTime lastLogin;

  LoginResponseModel({
    required this.userId,
    required this.email,
    required this.lastName,
    required this.firstName,
    required this.lastLogin,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        userId: json["user_id"],
        email: json["email"],
        lastName: json["last_name"],
        firstName: json["first_name"],
        lastLogin: DateTime.parse(json["last_login"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "email": email,
        "last_name": lastName,
        "first_name": firstName,
        "last_login": lastLogin.toIso8601String(),
      };
}
