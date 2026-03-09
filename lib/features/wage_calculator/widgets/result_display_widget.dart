import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/theme_colors.dart';
import '../../../models/wage_result_model.dart';
import 'breakdown_row_widget.dart';

class ResultDisplayWidget extends StatelessWidget {
  final WageResultModel result;

  const ResultDisplayWidget({super.key, required this.result});

  String _fmt(double v) {
    if (v >= 100000) return '₹${(v / 100000).toStringAsFixed(1)}L';
    final s = v.toInt().toString();
    if (s.length > 3) {
      return '₹${s.replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (m) => '${m[1]},',
      )}';
    }
    return '₹$s';
  }

  @override
  Widget build(BuildContext context) {
    final total = result.totalMonthly;
    final base = result.baseWage;
    final skill = result.skillPremium;
    final overhead = result.overheadCost;

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
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Monthly Wage',
                style: AppTextStyles.bodySmall(context),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: result.isFairLabourCompliant
                      ? AppColors.accent.withValues(alpha: 0.1)
                      : AppColors.accentRed.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: result.isFairLabourCompliant
                        ? AppColors.accent.withValues(alpha: 0.3)
                        : AppColors.accentRed.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  result.isFairLabourCompliant ? '✓ Fair' : '⚠ Low',
                  style: AppTextStyles.bodySmall(context).copyWith(
                    color: result.isFairLabourCompliant
                        ? AppColors.accent
                        : AppColors.accentRed,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Total animated
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: result.totalMonthly),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
            builder: (context, value, _) {
              return Text(
                _fmt(value),
                style: AppTextStyles.metricLarge(context),
              );
            },
          ),

          Text(
            '≈ ${_fmt(result.hourlyRate)}/hr · ${result.totalMonthly >= 15000 ? "Above" : "Below"} minimum wage',
            style: AppTextStyles.bodySmall(context),
          ),

          const SizedBox(height: 24),
          Container(height: 1, color: TC.border(context)),
          const SizedBox(height: 20),

          Text(
            'BREAKDOWN',
            style: AppTextStyles.label(context).copyWith(fontSize: 10),
          ),
          const SizedBox(height: 12),

          BreakdownRowWidget(
            label: 'Base Wage',
            value: _fmt(base),
            valueColor: TC.textPrimary(context),
            percent: base / total,
          ),
          BreakdownRowWidget(
            label: 'Skill Premium',
            value: _fmt(skill),
            valueColor: AppColors.accentYellow,
            percent: skill / total,
          ),
          BreakdownRowWidget(
            label: 'Overhead',
            value: _fmt(overhead),
            valueColor: AppColors.accentBlue,
            percent: overhead / total,
          ),

          const SizedBox(height: 16),

          // Annual
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: TC.surface2(context),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: TC.border(context)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Annual Package',
                  style: AppTextStyles.bodySmall(context),
                ),
                Text(
                  _fmt(result.totalMonthly * 12),
                  style: AppTextStyles.bodySmall(context).copyWith(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
