import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/theme_colors.dart';

class BreakdownRowWidget extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;
  final double percent;

  const BreakdownRowWidget({
    super.key,
    required this.label,
    required this.value,
    required this.valueColor,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: AppTextStyles.bodySmall(context)),
              Text(
                value,
                style: AppTextStyles.bodySmall(context).copyWith(
                  color: valueColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: percent.clamp(0.0, 1.0),
              backgroundColor: TC.surface2(context),
              valueColor: AlwaysStoppedAnimation<Color>(
                valueColor.withValues(alpha: 0.6),
              ),
              minHeight: 4,
            ),
          ),
        ],
      ),
    );
  }
}
