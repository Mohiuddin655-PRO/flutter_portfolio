import 'dart:convert';

SdkResponse sdkResponseFromMap(String str) =>
    SdkResponse.fromMap(json.decode(str));

String sdkResponseToMap(SdkResponse data) => json.encode(data.toMap());

class SdkResponse {
  final SDKData? data;
  final bool? isError;
  final Error? error;

  SdkResponse({
    this.data,
    this.isError,
    this.error,
  });

  SdkResponse copyWith({
    SDKData? data,
    bool? isError,
    Error? error,
  }) {
    return SdkResponse(
      data: data ?? this.data,
      isError: isError ?? this.isError,
      error: error ?? this.error,
    );
  }

  factory SdkResponse.fromMap(Map<String, dynamic> json) {
    var data = json["encoded"]["data"];
    var isError = json["encoded"]["isError"];
    var error = json["encoded"]["error"];
    return SdkResponse(
      data: data is Map<String, dynamic> ? SDKData.fromMap(data) : null,
      isError: isError is bool ? isError : null,
      error: error is Map<String, dynamic> ? Error.fromMap(error) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "data": data?.toMap(),
      "isError": isError,
      "error": error?.toMap(),
    };
  }
}

class SDKData {
  final String? userid;
  final List<SdkInfo>? sdks;

  const SDKData({
    this.userid,
    this.sdks,
  });

  SDKData copyWith({
    String? userid,
    List<SdkInfo>? sdks,
  }) {
    return SDKData(
      userid: userid ?? this.userid,
      sdks: sdks ?? this.sdks,
    );
  }

  factory SDKData.fromMap(Map<String, dynamic> json) {
    var uid = json["userid"];
    var sdks = json["sdks"];
    return SDKData(
      userid: uid is String ? uid : null,
      sdks: sdks is List
          ? List<SdkInfo>.from(sdks.map((x) => SdkInfo.fromMap(x)))
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "userid": userid,
      "sdks": sdks != null ? List.from(sdks!.map((x) => x.toMap())) : null,
    };
  }
}

class SdkInfo {
  final int? serialNumber;
  final String? appId;
  final String? token;
  final int? balance;
  final DateTime? validity;
  final String? sdkId;

  const SdkInfo({
    this.serialNumber,
    this.appId,
    this.token,
    this.balance,
    this.validity,
    this.sdkId,
  });

  SdkInfo copyWith({
    int? serialNumber,
    String? appId,
    String? token,
    int? balance,
    DateTime? validity,
    String? sdkId,
  }) {
    return SdkInfo(
      serialNumber: serialNumber ?? this.serialNumber,
      appId: appId ?? this.appId,
      token: token ?? this.token,
      balance: balance ?? this.balance,
      validity: validity ?? this.validity,
      sdkId: sdkId ?? this.sdkId,
    );
  }

  factory SdkInfo.fromMap(Map<String, dynamic> json) {
    var serialNumber = json["serialNumber"];
    var appId = json["appid"];
    var token = json["token"];
    var balance = json["balance"];
    var validity = json["validity"];
    var sdkId = json["sdkid"];

    return SdkInfo(
      serialNumber: serialNumber is int ? serialNumber : null,
      appId: appId is String ? appId : null,
      token: token is String ? token : null,
      balance: balance is int ? balance : null,
      validity: validity is String ? DateTime.tryParse(validity) : null,
      sdkId: sdkId is String ? sdkId : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "serialNumber": serialNumber,
      "appid": appId,
      "token": token,
      "balance": balance,
      "validity": validity?.toIso8601String(),
      "sdkid": sdkId,
    };
  }
}

class Error {
  Error();

  Error copyWith() => Error();

  factory Error.fromMap(Map<String, dynamic> json) => Error();

  Map<String, dynamic> toMap() => {};
}
