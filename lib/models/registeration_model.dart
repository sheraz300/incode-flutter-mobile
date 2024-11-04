// To parse this JSON data, do
//
//     final registerationResponseModel = registerationResponseModelFromJson(jsonString);

import 'dart:convert';

RegisterationResponseModel registerationResponseModelFromJson(String str) =>
    RegisterationResponseModel.fromJson(json.decode(str));

String registerationResponseModelToJson(RegisterationResponseModel data) =>
    json.encode(data.toJson());

class RegisterationResponseModel {
  String name;
  String email;
  String password;
  String id;
  DateTime createdAt;

  RegisterationResponseModel({
    required this.name,
    required this.email,
    required this.password,
    required this.id,
    required this.createdAt,
  });

  factory RegisterationResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterationResponseModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "id": id,
        "createdAt": createdAt.toIso8601String(),
      };
}
