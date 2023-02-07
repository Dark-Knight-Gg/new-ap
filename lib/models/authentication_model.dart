import 'dart:core';
import 'package:json_annotation/json_annotation.dart';
part 'authentication_model.g.dart';

@JsonSerializable()
class AuthenticationModel {
  AuthenticationModel({
    required this.account, required this.roles, required this.token, required this.tokenExpiredAt, required this.refreshToken, required this.deviceToken
  });
  @JsonKey(name: 'account')
  String account;
  @JsonKey(name: 'roles')
  List<String> roles;
  @JsonKey(name: 'token')
  String token;
  @JsonKey(name: 'tokenExpiredAt')
  String tokenExpiredAt;
  @JsonKey(name: 'refreshToken')
  String refreshToken;
  @JsonKey(name: 'deviceToken')
  String deviceToken;
  factory AuthenticationModel.fromJson(Map<String,dynamic> json) => _$AuthenticationModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticationModelToJson(this);
}
