import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/theme_colors.dart';
import '../home/widgets/nav_bar.dart';
import 'widgets/metric_card_widget.dart';
import 'widgets/chart_widget.dart';

class MetricsPage extends StatelessWidget {
  const MetricsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;
    final hPadding = isMobile ? 24.0 : 80.0;

    return Scaffold(
      backgroundColor: TC.bg(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 72),

                // Header
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: hPadding,
                    vertical: 48,
                  ),
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(-0.3, -0.5),
                      radius: 1.0,
                      colors: [
                        Color(0x10FF6B6B),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: TC.textMuted(context),
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Back',
                              style: AppTextStyles.bodySmall(context),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text('LIVE DATA', style: AppTextStyles.label(context)),
                      const SizedBox(height: 8),
                      Text(
                        'Impact Metrics',
                        style: AppTextStyles.h1(context).copyWith(
                          fontSize: isMobile ? 32 : 48,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: isMobile ? double.infinity : 560,
                        child: Text(
                          'Real-time data showing the community\'s reach, economic impact, and growth across India.',
                          style: AppTextStyles.bodyMedium(context),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Live indicator
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.accent,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Live — Updated just now',
                            style: AppTextStyles.bodySmall(context).copyWith(
                              color: AppColors.accent,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Metric Cards Grid
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: hPadding,
                    vertical: 32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'KEY METRICS',
                        style:
                            AppTextStyles.label(context).copyWith(fontSize: 10),
                      ),
                      const SizedBox(height: 20),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: isMobile ? 2 : 4,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: isMobile ? 0.9 : 1.0,
                        children: const [
                          MetricCardWidget(
                            icon: '👷',
                            value: 48200,
                            label: 'Workers Protected',
                            sublabel: 'via Fair Pricing Engine',
                            accentColor: Color(0xFF3DFFA0),
                          ),
                          MetricCardWidget(
                            icon: '💰',
                            value: 12,
                            prefix: '₹',
                            suffix: ' Cr+',
                            label: 'Fair Wages',
                            sublabel: 'Distributed this year',
                            accentColor: Color(0xFFFFCD3D),
                          ),
                          MetricCardWidget(
                            icon: '🏢',
                            value: 320,
                            label: 'Organizations',
                            sublabel: 'Using Fair Labour Standards',
                            accentColor: Color(0xFF8AB4FF),
                          ),
                          MetricCardWidget(
                            icon: '📍',
                            value: 18,
                            label: 'States Covered',
                            sublabel: 'Across India',
                            accentColor: Color(0xFFFF6B6B),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'ANALYTICS',
                        style:
                            AppTextStyles.label(context).copyWith(fontSize: 10),
                      ),
                      const SizedBox(height: 20),
                      isMobile
                          ? const Column(
                              children: [
                                WageBarChart(),
                                SizedBox(height: 20),
                                WorkersLineChart(),
                              ],
                            )
                          : const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: WageBarChart()),
                                SizedBox(width: 20),
                                Expanded(child: WorkersLineChart()),
                              ],
                            ),
                      const SizedBox(height: 40),
                      Text(
                        'STATE COVERAGE',
                        style:
                            AppTextStyles.label(context).copyWith(fontSize: 10),
                      ),
                      const SizedBox(height: 20),
                      _statesGrid(context, isMobile),
                    ],
                  ),
                ),

                const SizedBox(height: 60),
              ],
            ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(),
          ),
        ],
      ),
    );
  }

  Widget _statesGrid(BuildContext context, bool isMobile) {
    final states = [
      {'name': 'Maharashtra', 'workers': '8,200', 'color': 'accent'},
      {'name': 'Delhi', 'workers': '6,400', 'color': 'yellow'},
      {'name': 'Gujarat', 'workers': '5,100', 'color': 'accent'},
      {'name': 'Tamil Nadu', 'workers': '4,800', 'color': 'blue'},
      {'name': 'Karnataka', 'workers': '4,200', 'color': 'accent'},
      {'name': 'Rajasthan', 'workers': '3,600', 'color': 'red'},
      {'name': 'West Bengal', 'workers': '3,200', 'color': 'yellow'},
      {'name': 'Uttar Pradesh', 'workers': '2,900', 'color': 'blue'},
      {'name': 'Kerala', 'workers': '2,600', 'color': 'accent'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 2 : 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: isMobile ? 2.2 : 3.0,
      ),
      itemCount: states.length,
      itemBuilder: (context, i) {
        final s = states[i];
        final color = s['color'] == 'yellow'
            ? const Color(0xFFFFCD3D)
            : s['color'] == 'red'
                ? const Color(0xFFFF6B6B)
                : s['color'] == 'blue'
                    ? const Color(0xFF8AB4FF)
                    : const Color(0xFF3DFFA0);

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: TC.surface(context),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: TC.border(context)),
          ),
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      s['name']!,
                      style: AppTextStyles.cardTitle(context).copyWith(
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      '${s['workers']} workers',
                      style: AppTextStyles.bodySmall(context).copyWith(
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
