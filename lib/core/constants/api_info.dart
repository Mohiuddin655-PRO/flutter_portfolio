import 'dart:convert';

class ApiInfo {
  const ApiInfo._();

  static String basicHeaderUser = 'application';
  static String basicHeaderPass = 'secret';
  static final basicHeader =
      'Basic ${base64Encode(utf8.encode('$basicHeaderUser:$basicHeaderPass'))}';

  static const String baseUrl = "http://139.59.55.201:6001";
  static const String login = "auth/login";
  static const String signUp = "auth/signup";

  static const String loginUrl = "$baseUrl/$login";
  static const String signUpUrl = "$baseUrl/$signUp";

  static const String buySdkDemo = "$baseUrl/sdk";

  static String getSdkUrl({
    int page = 1,
    int fetchSize = 5,
  }) {
    return "$baseUrl/sdk?page=$page&item=$fetchSize";
  }
}
