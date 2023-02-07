// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      account: json['account'] as String,
      password: json['password'] as String,
      rememberMe: json['rememberMe'] as bool,
      deviceName: json['deviceName'] as String,
      deviceInfo: json['deviceInfo'] as String,
      deviceType: json['deviceType'] as String,
      deviceToken: json['deviceToken'] as String?,
      locationInfo: json['locationInfo'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'account': instance.account,
      'password': instance.password,
      'rememberMe': instance.rememberMe,
      'deviceName': instance.deviceName,
      'deviceInfo': instance.deviceInfo,
      'deviceType': instance.deviceType,
      'deviceToken': instance.deviceToken,
      'locationInfo': instance.locationInfo,
    };
