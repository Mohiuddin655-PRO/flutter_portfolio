import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AuthUtils {
  static Future<bool> isAuthorized([SharedPreferences? preferences]) async {
    var a = await authorizer(preferences);
    return a.uid != null && a.accessToken != null;
  }

  static Future<String> accessToken([SharedPreferences? preferences]) async {
    var a = await authorizer(preferences);
    return a.accessToken ?? "";
  }

  static Future<String> refreshToken([SharedPreferences? preferences]) async {
    var a = await authorizer(preferences);
    return a.refreshToken ?? "";
  }

  static Future<String> uid([SharedPreferences? preferences]) async {
    var a = await authorizer(preferences);
    return a.uid ?? "";
  }

  static Future<String> email([SharedPreferences? preferences]) async {
    var a = await authorizer(preferences);
    return a.email ?? "";
  }

  static Future<String> password([SharedPreferences? preferences]) async {
    var a = await authorizer(preferences);
    return a.password ?? "";
  }

  static Future<String> name([SharedPreferences? preferences]) async {
    var a = await authorizer(preferences);
    return a.name ?? "";
  }

  static Future<String> phone([SharedPreferences? preferences]) async {
    var a = await authorizer(preferences);
    return a.phone ?? "";
  }

  static Future<AuthorizeInfo> authorizer([
    SharedPreferences? preferences,
  ]) async {
    return AuthorizeInfo.fromPreferences(
      preferences ?? await SharedPreferences.getInstance(),
    );
  }

  static Future<bool> setAuthInfo(
    AuthorizeInfo info, [
    SharedPreferences? preferences,
  ]) async {
    return info.save(preferences ?? await SharedPreferences.getInstance());
  }
}

class AuthorizeInfo {
  String? uid;
  String? email;
  String? password;
  String? name;
  String? phone;
  String? accessToken;
  String? refreshToken;

  AuthorizeInfo({
    this.uid,
    this.email,
    this.password,
    this.name,
    this.phone,
    this.accessToken,
    this.refreshToken,
  });

  AuthorizeInfo modify({
    String? uid,
    String? email,
    String? password,
    String? name,
    String? phone,
    String? accessToken,
    String? refreshToken,
  }) {
    this.uid = uid ?? this.uid;
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.name = name ?? this.name;
    this.phone = phone ?? this.phone;
    this.accessToken = accessToken ?? this.accessToken;
    this.refreshToken = refreshToken ?? this.refreshToken;
    return this;
  }

  AuthorizeInfo copy({
    String? uid,
    String? email,
    String? password,
    String? name,
    String? phone,
    String? accessToken,
    String? refreshToken,
  }) {
    return AuthorizeInfo(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  factory AuthorizeInfo.fromPreferences(SharedPreferences preferences) {
    var raw = preferences.getString("__auth_info__");
    if (raw is String) {
      return AuthorizeInfo.fromJson(raw);
    }
    return AuthorizeInfo();
  }

  factory AuthorizeInfo.fromJson(String json) {
    var data = jsonDecode(json);
    if (data is Map<String, dynamic>) {
      return AuthorizeInfo.fromMap(data);
    }
    return AuthorizeInfo();
  }

  factory AuthorizeInfo.fromMap(Map<String, dynamic> source) {
    var uid = source["uid"];
    var email = source["email"];
    var password = source["password"];
    var name = source["name"];
    var phone = source["phone"];
    var accessToken = source["accessToken"];
    var refreshToken = source["refreshToken"];
    return AuthorizeInfo(
      uid: uid is String ? uid : null,
      email: email is String ? email : null,
      password: password is String ? password : null,
      name: name is String ? name : null,
      phone: phone is String ? phone : null,
      accessToken: accessToken is String ? accessToken : null,
      refreshToken: refreshToken is String ? refreshToken : null,
    );
  }

  Future<bool> save(SharedPreferences preferences) async {
    return preferences.setString("__auth_info__", jsonEncode(source));
  }

  Map<String, dynamic> get source {
    return {
      "uid": uid,
      "email": email,
      "password": password,
      "name": name,
      "phone": phone,
      "accessToken": accessToken,
      "refreshToken": refreshToken,
    };
  }
}
