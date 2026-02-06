import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flymate/feature/auth/data/local/secure_storage_service.dart';

class SecureStorageImpl implements SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageImpl()
      : _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      resetOnError: true, // Automatically clears storage if keys are corrupted
      biometricPromptTitle: 'Authentication Required',
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock, // Recommended for background tasks
    ),
  );

  @override
  Future<void> write(String key, String? value) async {
    try {
      await _storage.write(key: key, value: value);
    } on PlatformException catch (e) {
      _handlePlatformException(e);
    }
  }

  @override
  Future<String?> read(String key) async {
    try {
      return await _storage.read(key: key);
    } on PlatformException catch (e) {
      _handlePlatformException(e);
      return null;
    }
  }

  @override
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  /// Centralized error handling as seen in your example code
  void _handlePlatformException(PlatformException e) {

     if (e.message?.contains('BIOMETRIC_UNAVAILABLE') ?? false) {

    }
    throw e;
  }
}
