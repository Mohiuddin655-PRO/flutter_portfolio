import 'dart:convert';

AuthResponse authResponseFromMap(String str) =>
    AuthResponse.fromMap(json.decode(str));

String authResponseToMap(AuthResponse data) => json.encode(data.toMap());

class AuthResponse {
  final AuthData? data;
  final bool? isError;
  final AuthError? error;

  const AuthResponse({
    this.data,
    this.isError,
    this.error,
  });

  AuthResponse copyWith({
    AuthData? data,
    bool? isError,
    AuthError? error,
  }) {
    return AuthResponse(
      data: data ?? this.data,
      isError: isError ?? this.isError,
      error: error ?? this.error,
    );
  }

  factory AuthResponse.fromMap(Map<String, dynamic> json) {
    var data = json["encoded"]["data"];
    var error = json["encoded"]["error"];

    return AuthResponse(
      isError: json["encoded"]["isError"],
      data: data is Map<String, dynamic> ? AuthData.fromMap(data) : null,
      error: error is Map<String, dynamic> ? AuthError.fromMap(error) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "data": data?.toMap(),
      "isError": isError,
      "error": error?.toMap(),
    };
  }

  @override
  String toString() {
    return toMap().toString();
  }
}

class AuthData {
  final String? accessToken;
  final DateTime? accessTokenExpiresAt;
  final String? refreshToken;
  final DateTime? refreshTokenExpiresAt;
  final String? client;
  final AuthUser? user;
  final String? userid;

  const AuthData({
    this.accessToken,
    this.accessTokenExpiresAt,
    this.refreshToken,
    this.refreshTokenExpiresAt,
    this.client,
    this.user,
    this.userid,
  });

  AuthData copyWith({
    String? accessToken,
    DateTime? accessTokenExpiresAt,
    String? refreshToken,
    DateTime? refreshTokenExpiresAt,
    String? client,
    AuthUser? user,
    String? userid,
  }) {
    return AuthData(
      accessToken: accessToken ?? this.accessToken,
      accessTokenExpiresAt: accessTokenExpiresAt ?? this.accessTokenExpiresAt,
      refreshToken: refreshToken ?? this.refreshToken,
      refreshTokenExpiresAt:
          refreshTokenExpiresAt ?? this.refreshTokenExpiresAt,
      client: client ?? this.client,
      user: user ?? this.user,
      userid: userid ?? this.userid,
    );
  }

  factory AuthData.fromMap(Map<String, dynamic> json) {
    var accessToken = json["accessToken"];
    var accessTokenExpiresAt = json["accessTokenExpiresAt"];
    var refreshToken = json["refreshToken"];
    var refreshTokenExpiresAt = json["refreshTokenExpiresAt"];
    var client = json["client"];
    var user = json["user"];
    var userid = json["userid"];
    return AuthData(
      accessToken: accessToken is String ? accessToken : null,
      accessTokenExpiresAt: accessTokenExpiresAt is String
          ? DateTime.tryParse(accessTokenExpiresAt)
          : null,
      refreshToken: refreshToken is String ? refreshToken : null,
      refreshTokenExpiresAt: refreshTokenExpiresAt is String
          ? DateTime.tryParse(refreshTokenExpiresAt)
          : null,
      client: client is String ? client : null,
      user: user is Map<String, dynamic> ? AuthUser.fromMap(user) : null,
      userid: userid is String ? userid : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "accessToken": accessToken,
      "accessTokenExpiresAt": accessTokenExpiresAt?.toIso8601String(),
      "refreshToken": refreshToken,
      "refreshTokenExpiresAt": refreshTokenExpiresAt?.toIso8601String(),
      "client": client,
      "user": user?.toMap(),
      "userid": userid,
    };
  }

  @override
  String toString() {
    return toMap().toString();
  }
}

class AuthUser {
  final String? email;

  const AuthUser({
    this.email,
  });

  AuthUser copyWith({
    String? email,
  }) {
    return AuthUser(
      email: email ?? this.email,
    );
  }

  factory AuthUser.fromMap(Map<String, dynamic> json) {
    var email = json["email"];
    return AuthUser(
      email: email is String ? email : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "email": email,
    };
  }

  @override
  String toString() {
    return toMap().toString();
  }
}

class AuthError {
  AuthError();

  AuthError copyWith() {
    return AuthError();
  }

  factory AuthError.fromMap(Map<String, dynamic> json) {
    return AuthError();
  }

  Map<String, dynamic> toMap() {
    return {};
  }
}
