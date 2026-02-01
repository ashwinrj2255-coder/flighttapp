import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  // Common
  final String hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final double borderRadius;
  final Color? borderColor;

  // TextField-specific
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;

  // Override
  final Widget? child;

  const CustomTextFieldWidget({
    super.key,
    required this.hintText,
    this.labelText,
    this.prefixIcon,
    this.borderRadius = 10,
    this.borderColor,
    this.keyboardType,
    this.controller,
    this.obscureText = false,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: borderColor ?? AppColors.borderColor),
    );

    final decoration = InputDecoration(
      hintText: hintText,
      labelText: labelText,
      prefixIcon: prefixIcon,
      border: border,
      enabledBorder: border,
      disabledBorder: border.copyWith(
        borderSide: const BorderSide(color: Colors.black, width: 1.5),
      ),
      focusedBorder: border.copyWith(
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
      ),

    );

    // 🔹 If child is provided, use it
    if (child != null) {
      return InkWell(
        onTap: readOnly ? onTap : null,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InputDecorator(decoration: decoration, child: child),
      );
    }

    // 🔹 Default TextField
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      onTap: onTap,
      onChanged: readOnly ? null : onChanged,
      decoration: decoration,
    );
  }
}
