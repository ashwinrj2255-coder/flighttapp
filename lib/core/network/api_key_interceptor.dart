import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Adds your Kiwi API Key
class ApiKeyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['apikey'] = 'jhOomAmH2iQ0XR0A_13H5vj4q9PpWy7z';
    handler.next(options);
  }
}

/// Automatically attaches the latest Firebase JWT to every backend call
class JwtInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final idToken = await user.getIdToken();
      options.headers['Authorization'] = 'Bearer $idToken';
    }
    handler.next(options);
  }
}