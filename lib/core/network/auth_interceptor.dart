import 'package:dio/dio.dart';

import '../../feature/auth/data/local/secure_storage_service.dart';
import '../../feature/auth/data/local/storage_keys.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorageService _storage;

  AuthInterceptor(this._storage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final jwt = await _storage.read(StorageKeys.accessToken);

    if (jwt != null) {
      options.headers['Authorization'] = 'Bearer $jwt';
    }

    super.onRequest(options, handler);
  }
}
