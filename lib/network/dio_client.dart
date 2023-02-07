import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vti_express/repository/authentication_repository.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';



import '../common/endpoints.dart';

class DioClient {
  Dio dio = Dio(BaseOptions(baseUrl: Endpoints.baseUrl));
  String? accessToken;

// will throw an error
  final _storage = const FlutterSecureStorage();
  // AuthenticationRepository authenticationRepository =
  //     AuthenticationRepository();

  DioClient() {
    dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
    ));
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      // if (!options.path.contains('http')) {
      //   options.path = Endpoints.baseUrl + options.path;
      // }
      options.headers['Authorization'] = 'Bearer $accessToken';
      options.connectTimeout = 5000;
      options.receiveTimeout = 5000;
      return handler.next(options);
    }, onResponse: (response, handler) {
      if (accessToken == null) {
        accessToken = response.data['token'];
      }
      return handler.next(response);
    }, onError: (DioError error, handler) async {
      if ((error.response?.statusCode == 401)) {
        if (await _storage.containsKey(key: 'refreshToken')) {
          // will throw error below
          await refreshToken();
          return handler.resolve(await _retry(error.requestOptions));
        }
      }
      return handler.next(error);
    }));
  }

  Future<void> refreshToken() async {
    final refreshToken = await _storage.read(key: 'refreshToken');
    final response = await dio
        .post('auth/refresh-token', data: {'refreshToken': refreshToken});

    if (response.statusCode == 201) {
      // successfully got the new access token
      accessToken = response.data;
    } else {
      // refresh token is wrong so log out user.
      accessToken = null;
      _storage.deleteAll();
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
