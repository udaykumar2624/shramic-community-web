import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/theme_colors.dart';
import '../../../models/wage_result_model.dart';
import 'fair_badge_widget.dart';

class PricingResultPanel extends StatelessWidget {
  final WageResultModel result;

  const PricingResultPanel({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.accent.withValues(alpha: 0.08),
            AppColors.accent.withValues(alpha: 0.02),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.accent.withValues(alpha: 0.25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recommended Monthly Wage',
            style: AppTextStyles.bodySmall(context),
          ),
          const SizedBox(height: 8),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: result.totalMonthly),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOut,
            builder: (context, value, _) {
              return Text(
                '₹${_formatNumber(value)}',
                style: AppTextStyles.metricLarge(context).copyWith(
                  fontSize: 48,
                ),
              );
            },
          ),
          Text(
            '≈ ₹${_formatNumber(result.hourlyRate)}/hr',
            style: AppTextStyles.bodyMedium(context),
          ),
          const SizedBox(height: 28),
          Container(height: 1, color: TC.border(context)),
          const SizedBox(height: 20),
          Text(
            'BREAKDOWN',
            style: AppTextStyles.label(context).copyWith(fontSize: 10),
          ),
          const SizedBox(height: 12),
          _breakdownRow(
            context,
            'Base Wage',
            '₹${_formatNumber(result.baseWage)}',
            TC.textPrimary(context),
          ),
          _breakdownRow(
            context,
            'Skill Premium',
            '₹${_formatNumber(result.skillPremium)}',
            AppColors.accentYellow,
          ),
          _breakdownRow(
            context,
            'Region Adjustment',
            '${result.regionAdjustment >= 0 ? '+' : ''}${result.regionAdjustment.toInt()}%',
            result.regionAdjustment >= 0
                ? AppColors.accent
                : AppColors.accentRed,
          ),
          _breakdownRow(
            context,
            'Overhead Coverage',
            '₹${_formatNumber(result.overheadCost)}',
            AppColors.accentBlue,
          ),
          const SizedBox(height: 20),
          FairBadgeWidget(isCompliant: result.isFairLabourCompliant),
        ],
      ),
    );
  }

  Widget _breakdownRow(
    BuildContext context,
    String label,
    String value,
    Color valueColor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.bodySmall(context)),
          Text(
            value,
            style: AppTextStyles.bodySmall(context).copyWith(
              color: valueColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _formatNumber(double value) {
    if (value >= 10000000) {
      return '${(value / 10000000).toStringAsFixed(1)} Cr';
    } else if (value >= 100000) {
      return '${(value / 100000).toStringAsFixed(1)} L';
    }
    final parts = value.toInt().toString();
    if (parts.length > 3) {
      return parts.replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (m) => '${m[1]},',
      );
    }
    return parts;
  }
}
