import 'package:dio/dio.dart';

import '../../domain/models/get_user_response_model.dart';
import '../local/secure_storage_service.dart';
import '../local/storage_keys.dart';
import '../service/auth_service.dart';

class AuthRepository {
  final FirebaseAuthService _firebaseService;
  final SecureStorageService _storage; // Inject storage
  final Dio _dio;

  AuthRepository({
    required FirebaseAuthService firebaseService,
    required SecureStorageService storage,
    required Dio dio,
  }) : _firebaseService = firebaseService,
       _storage = storage,
       _dio = dio;

  Future<GetUserResponseModel?> googleLoginAndSync() async {
    try {
      // 1. Firebase Login
      final user = await _firebaseService.signInWithGoogle();
      if (user == null) return null;

      // 2. Get Firebase ID Token
      final idToken = await user.getIdToken();

      // 3. Exchange for Backend JWT
      final response = await _dio.post(
        '/auth/oauth',
        options: Options(headers: {'Authorization': 'Bearer $idToken'}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // 4. Parse the Response using your generated fromJson
        final model = GetUserResponseModel.fromJson(response.data);
        final accessToken = model.data?.accessToken;
        final refreshToken = model.data?.refreshToken;

        // 5. Save tokens to Secure Storage
        // Accessing deep nested data safely from the model
        if (accessToken != null && refreshToken != null) {
          await _storage.write(StorageKeys.accessToken, accessToken);
          await _storage.write(StorageKeys.refreshToken, refreshToken);

          print("✅ Backend JWT Saved to Secure Storage");
        } else {
          throw Exception("Login succeedded but baclendtokens were missing");
        }
        return model; // Return the actual Model object
      }
      return null;
    } catch (e) {
      // 6. Cleanup on failure
      await _firebaseService.signOut();
      await _storage.delete(StorageKeys.accessToken);
      await _storage.delete(StorageKeys.refreshToken);
      rethrow;
    }
  }
}
