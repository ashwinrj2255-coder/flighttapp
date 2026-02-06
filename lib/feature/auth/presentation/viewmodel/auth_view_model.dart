import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flymate/feature/auth/data/repository/auth_repository.dart';
import 'package:flymate/feature/auth/data/service/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final FirebaseAuthService _firebaseAuthService;
  final AuthRepository _authRepository;

  AuthViewModel(this._firebaseAuthService, this._authRepository);

  bool _isLoadingGoogle = false;
  bool get isLoadingGoogle => _isLoadingGoogle;

  bool _isLoadingEmail = false;
  bool get isLoadingEmail => _isLoadingEmail;

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  String? _error;
  String? get error => _error;

  Future<void> signInWithGoogleJwt() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final user = await _authRepository.googleLoginAndSync();
      if (user == null) {
        _error = "Sign in cancelled by user.";
      }
    } catch (e) {
       _error = e.toString().replaceAll("Exception: ", "");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signInWithGoogle() async {
    if (_isLoadingGoogle) return;

    _isLoadingGoogle = true;
    _error = null;
    notifyListeners();

    try {
      await _firebaseAuthService.signInWithGoogle();
    } catch (e) {
      _error = e.toString();
      throw Exception('Error signIn : $e');
    } finally {
      _isLoadingGoogle = false;
      notifyListeners();
    }
  }

  Future<void> signInWithEmailAndPassword({
    required email,
    required password,
  }) async {
    if (_isLoadingEmail) return;
    _isLoadingEmail = true;
    notifyListeners();

    try {
      await _firebaseAuthService.signInWithEmail(
        emailAddress: email,
        password: password,
      );
    } catch (e) {
      throw Exception("Error : $e");
    } finally {
      _isLoadingEmail = false;
      notifyListeners();
    }
  }
}
