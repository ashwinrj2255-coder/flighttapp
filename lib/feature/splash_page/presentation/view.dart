 import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
 import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../auth/data/local/secure_storage_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _handleNavigation();
  }

  Future<void> _handleNavigation() async {
    // 1. Wait for the animation to play a bit (2.5 seconds)
    await Future.delayed(const Duration(milliseconds: 2500));

    if (!mounted) return;

    // 2. Access your SecureStorageService from Provider
    final storage = context.read<SecureStorageService>();

    // 3. Check for the Backend Token (NOT just Firebase)
    final token = await storage.read('access_token');

    // Optional: Also check if Firebase session is still alive
    final user = FirebaseAuth.instance.currentUser;

    if (token != null && user != null) {
      // User has a valid backend session
      context.go('/home');
    } else {
      // No token or no Firebase user, go to Login
      context.go('/auth');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.airplanemode_active, size: 80, color: Colors.white)
                .animate(onPlay: (controller) => controller.repeat())
                .shimmer(
              delay: 400.ms,
              duration: 1800.ms,
              color: AppColors.primaryColor,
            )
                .moveY(begin: 0, end: -20, curve: Curves.easeInOutSine, duration: 1000.ms)
                .then()
                .moveY(begin: -20, end: 0, curve: Curves.easeInOutSine, duration: 1000.ms),
            const SizedBox(height: 20),
            const Text(
              "Fly Mate",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 4,
                fontWeight: FontWeight.w300,
              ),
            ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.5, end: 0),
          ],
        ),
      ),
    );
  }
}