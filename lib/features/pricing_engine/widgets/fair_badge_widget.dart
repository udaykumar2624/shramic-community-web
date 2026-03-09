import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class FairBadgeWidget extends StatelessWidget {
  final bool isCompliant;

  const FairBadgeWidget({super.key, required this.isCompliant});

  @override
  Widget build(BuildContext context) {
    final color = isCompliant ? AppColors.accent : AppColors.accentRed;
    final icon = isCompliant ? '✓' : '⚠';
    final text =
        isCompliant ? 'Fair Labour Compliant' : 'Below Minimum Threshold';

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: TextStyle(color: color, fontSize: 14)),
          const SizedBox(width: 8),
          Text(
            text,
            style: AppTextStyles.bodySmall(context).copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
