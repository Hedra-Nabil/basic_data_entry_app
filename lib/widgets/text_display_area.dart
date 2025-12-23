import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class TextDisplayArea extends StatelessWidget {
  final String? displayedText;

  const TextDisplayArea({super.key, this.displayedText});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hasText = displayedText != null && displayedText!.isNotEmpty;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkDisplayBackground
            : AppColors.lightDisplayBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? AppColors.darkInputBorder.withOpacity(0.3)
              : AppColors.lightInputBorder.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Entered Text:',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            hasText ? displayedText! : 'No text entered yet.',
            style: TextStyle(
              fontSize: 16,
              color: hasText
                  ? (isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.lightTextPrimary)
                  : (isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary),
            ),
          ),
        ],
      ),
    );
  }
}
