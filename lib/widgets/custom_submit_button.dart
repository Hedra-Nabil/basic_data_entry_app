import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CustomSubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomSubmitButton({
    super.key,
    required this.onPressed,
    this.text = 'Submit',
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isDark
              ? AppColors.darkButtonBackground
              : AppColors.lightButtonBackground,
          foregroundColor: isDark
              ? AppColors.darkButtonText
              : AppColors.lightButtonText,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
