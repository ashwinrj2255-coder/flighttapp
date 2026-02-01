import 'package:dio/dio.dart';
import 'package:flymate/core/network/auth_interceptor.dart';

import 'error_interceptor.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();

  factory DioClient() => _instance;

  late final Dio _dio;

  Dio get dio => _dio;

  DioClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://tequila-api.kiwi.com/',
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 25),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    _dio.interceptors.addAll([
      AuthInterceptor(),
      LogInterceptor(responseBody: true),
      ErrorInterceptor(),
    ]);
  }
}
