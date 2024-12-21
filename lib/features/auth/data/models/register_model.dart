import 'dart:convert';

RegisterModel registerModelFromMap(String str) => RegisterModel.fromMap(json.decode(str));

String registerModelToMap(RegisterModel data) => json.encode(data.toMap());

class RegisterModel {
  String id;
  String displayName;
  String accessToken;
  String refreshToken;

  RegisterModel({
    required this.id,
    required this.displayName,
    required this.accessToken,
    required this.refreshToken,
  });

  factory RegisterModel.fromMap(Map<String, dynamic> json) => RegisterModel(
    id: json["_id"],
    displayName: json["displayName"],
    accessToken: json["access_token"],
    refreshToken: json["refresh_token"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "displayName": displayName,
    "access_token": accessToken,
    "refresh_token": refreshToken,
  };
}
