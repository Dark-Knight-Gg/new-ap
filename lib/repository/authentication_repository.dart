import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vti_express/common/get_device_info.dart';
import 'package:vti_express/common/get_device_name.dart';
import 'package:vti_express/models/login_request.dart';
import 'package:vti_express/network/dio_client.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated, loginFail }

class AuthenticationRepository {
  final storage = const FlutterSecureStorage();
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unknown;
    yield* _controller.stream;
  }

  Future<AuthenticationStatus> logIn({
    required String username,
    required String password,
  }) async {
    // await Future.delayed(const Duration(milliseconds: 300), () {
    //   if (checkEmail(username) && checkPassword(password)) {
    //     _controller.add(AuthenticationStatus.authenticated);
    //   }else{
    //     _controller.add(AuthenticationStatus.loginFail);
    //   }
    // });
    var dio = DioClient();
    var deviceName = GetDeviceName();
    var deviceInfo = GetDeviceInfo();
    Response response = await dio
        .post('auth/login?by=email', data: LoginRequest(account: username, password: password, rememberMe: false, deviceName: deviceName.toString(), deviceInfo: deviceInfo.toString(), deviceType: 'MOBILE', deviceToken: null, locationInfo: 'UNKNOWN'));
    if (response.statusCode == 200) {
      return AuthenticationStatus.authenticated;
    } else {
      return AuthenticationStatus.loginFail;
    }
  }

  AuthenticationStatus logOut() {
   return AuthenticationStatus.unauthenticated;
  }

  void dispose() => _controller.close();
}
