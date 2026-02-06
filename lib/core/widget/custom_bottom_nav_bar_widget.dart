import 'package:flutter/material.dart';

class CustomBottomNavBarWidget extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavBarWidget({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.abc))
    ]);
  }
}
