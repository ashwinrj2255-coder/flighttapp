import 'package:dio/dio.dart';
import '../../feature/auth/data/local/secure_storage_service.dart';
import 'auth_interceptor.dart';
import 'error_interceptor.dart';

class DioClient {
  // This is the static method your provider calls
  static Dio build(SecureStorageService storage) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://willodean-unjumpable-jule.ngrok-free.dev/app/v1',
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 25),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.addAll([
      AuthInterceptor(storage),
      LogInterceptor(responseBody: true, requestHeader: true),
      ErrorInterceptor(),
    ]);

    return dio;
  }
}