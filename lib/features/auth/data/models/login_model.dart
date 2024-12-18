
import 'dart:convert';

LoginModel loginModelFromMap(String str) => LoginModel.fromMap(json.decode(str));

String loginModelToMap(LoginModel data) => json.encode(data.toMap());

class LoginModel {
  String id;
  String accessToken;
  String refreshToken;

  LoginModel({
    required this.id,
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
    id: json["_id"],
    accessToken: json["access_token"],
    refreshToken: json["refresh_token"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "access_token": accessToken,
    "refresh_token": refreshToken,
  };
}
