import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // We trigger the navigation after the widget builds
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (context.mounted) {
        context.go('/home');
      }
    });

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.airplanemode_active,
              size: 80,
              color: Colors.white,
            )
                .animate(onPlay: (controller) => controller.repeat())
                .shimmer(delay: 400.ms, duration: 1800.ms, color: AppColors.primaryColor)
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
            )
                .animate()
                .fadeIn(delay: 300.ms)
                .slideY(begin: 0.5, end: 0),
          ],
        ),
      ),
    );
  }
}