// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationModel _$AuthenticationModelFromJson(Map<String, dynamic> json) =>
    AuthenticationModel(
      account: json['account'] as String,
      roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
      token: json['token'] as String,
      tokenExpiredAt: json['tokenExpiredAt'] as String,
      refreshToken: json['refreshToken'] as String,
      deviceToken: json['deviceToken'] as String,
    );

Map<String, dynamic> _$AuthenticationModelToJson(
        AuthenticationModel instance) =>
    <String, dynamic>{
      'account': instance.account,
      'roles': instance.roles,
      'token': instance.token,
      'tokenExpiredAt': instance.tokenExpiredAt,
      'refreshToken': instance.refreshToken,
      'deviceToken': instance.deviceToken,
    };
