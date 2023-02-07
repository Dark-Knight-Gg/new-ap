import 'dart:core';
import 'package:json_annotation/json_annotation.dart';
part 'login_request.g.dart';
@JsonSerializable()
class LoginRequest {

  @JsonKey(name: 'account')
  String account;
  @JsonKey(name: 'password')
  String password;
  @JsonKey(name: 'rememberMe')
  bool rememberMe = false;
  @JsonKey(name: 'deviceName')
  String deviceName = 'Sam Sung GalaXy';
  @JsonKey(name: 'deviceInfo')
  String deviceInfo ='S23';
  @JsonKey(name: 'deviceType')
  String deviceType = 'MOBILE';
  @JsonKey(name: 'deviceToken')
  String? deviceToken;
  @JsonKey(name: 'locationInfo')
  String locationInfo = 'UNKNOWN';
  LoginRequest({required this.account, required this.password,  required this.rememberMe, required this.deviceName,
    required this.deviceInfo, required this.deviceType, required this.deviceToken, required this.locationInfo});
  factory LoginRequest.fromJson(Map<String,dynamic> json) => _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

