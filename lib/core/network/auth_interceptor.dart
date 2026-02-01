import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor{
  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) {
    options.headers['apikey'] = '';
    super.onRequest(options, handler);
  }
}