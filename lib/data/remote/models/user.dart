import 'package:data_management/core.dart';
import 'package:flutter_andomie/core.dart';

class User extends Data {
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? photo;
  final String? accessToken;
  final String? refreshToken;
  final String? clientId;

  User({
    super.id,
    super.timeMills,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.photo,
    this.accessToken,
    this.refreshToken,
    this.clientId,
  });

  factory User.from(Map<String, dynamic> source) {
    return User(
      id: source.entityValue("id"),
      timeMills: source.entityValue("time_mills"),
      name: source.entityValue("name"),
      email: source.entityValue("email"),
      password: source.entityValue("password"),
      phone: source.entityValue("phone"),
      photo: source.entityValue("photo"),
      accessToken: source.entityValue("access_token"),
      refreshToken: source.entityValue("refresh_token"),
      clientId: source.entityValue("client_id"),
    );
  }

  @override
  Map<String, dynamic> get source {
    return super.source.attach({
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "photo": photo,
      "access_token": accessToken,
      "refresh_token": refreshToken,
      "client_id": clientId,
    });
  }
}
