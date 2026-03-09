import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class WageBarChart extends StatelessWidget {
  const WageBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'WAGE TRENDS',
                    style: AppTextStyles.label(context).copyWith(fontSize: 10),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Average Fair Wage by Sector',
                    style: AppTextStyles.h3(context),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surface2,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  '2024–25',
                  style: AppTextStyles.bodySmall(context).copyWith(
                    color: AppColors.accent,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          SizedBox(
            height: 220,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 40000,
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: AppColors.surface2,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      const sectors = [
                        'Construction',
                        'Textile',
                        'Agriculture',
                        'Domestic',
                        'Mfg',
                        'Transport',
                      ];
                      return BarTooltipItem(
                        '${sectors[groupIndex]}\n₹${rod.toY.toInt()}',
                        AppTextStyles.bodySmall(context).copyWith(
                          color: AppColors.accent,
                        ),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const sectors = [
                          'Const',
                          'Text',
                          'Agri',
                          'Dom',
                          'Mfg',
                          'Trans',
                        ];
                        if (value.toInt() >= sectors.length) {
                          return const SizedBox();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            sectors[value.toInt()],
                            style: AppTextStyles.bodySmall(context).copyWith(
                              fontSize: 10,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 48,
                      getTitlesWidget: (value, meta) {
                        if (value == 0) return const SizedBox();
                        return Text(
                          '₹${(value / 1000).toInt()}k',
                          style: AppTextStyles.bodySmall(context).copyWith(
                            fontSize: 10,
                          ),
                        );
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (_) => const FlLine(
                    color: AppColors.border,
                    strokeWidth: 1,
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: [
                  _bar(0, 22000, AppColors.accent),
                  _bar(1, 18000, AppColors.accentYellow),
                  _bar(2, 14000, AppColors.accentRed),
                  _bar(3, 16000, AppColors.accentBlue),
                  _bar(4, 25000, AppColors.accent),
                  _bar(5, 19000, AppColors.accentYellow),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData _bar(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: color.withValues(alpha: 0.8),
          width: 28,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(6),
          ),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 40000,
            color: AppColors.surface2,
          ),
        ),
      ],
    );
  }
}

class WorkersLineChart extends StatelessWidget {
  const WorkersLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'GROWTH',
            style: AppTextStyles.label(context).copyWith(fontSize: 10),
          ),
          const SizedBox(height: 4),
          Text(
            'Workers Onboarded Monthly',
            style: AppTextStyles.h3(context),
          ),
          const SizedBox(height: 28),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                minY: 0,
                maxY: 8000,
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    tooltipBgColor: AppColors.surface2,
                    getTooltipItems: (spots) => spots
                        .map(
                          (s) => LineTooltipItem(
                            '${s.y.toInt()} workers',
                            AppTextStyles.bodySmall(context).copyWith(
                              color: AppColors.accent,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (_) => const FlLine(
                    color: AppColors.border,
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const months = [
                          'Apr',
                          'May',
                          'Jun',
                          'Jul',
                          'Aug',
                          'Sep',
                          'Oct',
                          'Nov',
                          'Dec',
                          'Jan',
                          'Feb',
                          'Mar',
                        ];
                        if (value.toInt() >= months.length) {
                          return const SizedBox();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            months[value.toInt()],
                            style: AppTextStyles.bodySmall(context).copyWith(
                              fontSize: 10,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 44,
                      getTitlesWidget: (value, meta) {
                        if (value == 0) return const SizedBox();
                        return Text(
                          '${(value / 1000).toInt()}k',
                          style: AppTextStyles.bodySmall(context).copyWith(
                            fontSize: 10,
                          ),
                        );
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 1200),
                      FlSpot(1, 2100),
                      FlSpot(2, 2800),
                      FlSpot(3, 3200),
                      FlSpot(4, 3800),
                      FlSpot(5, 4100),
                      FlSpot(6, 4600),
                      FlSpot(7, 5200),
                      FlSpot(8, 5800),
                      FlSpot(9, 6200),
                      FlSpot(10, 6900),
                      FlSpot(11, 7500),
                    ],
                    isCurved: true,
                    color: AppColors.accent,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.accent.withValues(alpha: 0.2),
                          AppColors.accent.withValues(alpha: 0.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
