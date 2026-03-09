import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/theme_colors.dart';
import '../../models/wage_result_model.dart';
import '../../services/pricing_service.dart';
import '../home/widgets/nav_bar.dart';
import 'widgets/slider_input_widget.dart';
import 'widgets/pricing_result_panel.dart';

class PricingPage extends StatefulWidget {
  const PricingPage({super.key});

  @override
  State<PricingPage> createState() => _PricingPageState();
}

class _PricingPageState extends State<PricingPage> {
  double _hours = 40;
  double _skill = 5;
  double _region = 100;
  double _overhead = 20;

  late WageResultModel _result;

  @override
  void initState() {
    super.initState();
    _calculate();
  }

  void _calculate() {
    _result = PricingService.calculate(
      hoursPerWeek: _hours,
      skillLevel: _skill,
      regionIndex: _region,
      overheadPercent: _overhead,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Scaffold(
      backgroundColor: TC.bg(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 72),

                // Page Header
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 80,
                    vertical: 48,
                  ),
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(-0.5, -0.5),
                      radius: 1.0,
                      colors: [
                        Color(0x143DFFA0),
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
                      Text('FAIR LABOUR', style: AppTextStyles.label(context)),
                      const SizedBox(height: 8),
                      Text(
                        'Pricing Engine',
                        style: AppTextStyles.h1(context).copyWith(
                          fontSize: isMobile ? 32 : 48,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: isMobile ? double.infinity : 560,
                        child: Text(
                          'Calculate fair wages based on skill level, region cost index, and industry overhead. All calculations follow national minimum wage guidelines.',
                          style: AppTextStyles.bodyMedium(context),
                        ),
                      ),
                    ],
                  ),
                ),

                // Main Content
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 80,
                    vertical: 40,
                  ),
                  child: isMobile
                      ? Column(
                          children: [
                            _inputPanel(context),
                            const SizedBox(height: 24),
                            PricingResultPanel(result: _result),
                            const SizedBox(height: 40),
                            _infoCards(context),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  _inputPanel(context),
                                  const SizedBox(height: 24),
                                  _infoCards(context),
                                ],
                              ),
                            ),
                            const SizedBox(width: 32),
                            Expanded(
                              flex: 4,
                              child: PricingResultPanel(result: _result),
                            ),
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

  Widget _inputPanel(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: TC.surface(context),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: TC.border(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.tune,
                  color: AppColors.accent,
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              Text('Input Parameters', style: AppTextStyles.h3(context)),
            ],
          ),
          const SizedBox(height: 28),
          SliderInputWidget(
            label: 'Base Hours / Week',
            value: _hours,
            min: 20,
            max: 60,
            displayValue: '${_hours.toInt()} hrs',
            onChanged: (v) => setState(() {
              _hours = v;
              _calculate();
            }),
          ),
          const SizedBox(height: 20),
          SliderInputWidget(
            label: 'Skill Level',
            value: _skill,
            min: 1,
            max: 10,
            displayValue: '${_skill.toInt()} / 10',
            onChanged: (v) => setState(() {
              _skill = v;
              _calculate();
            }),
          ),
          const SizedBox(height: 20),
          SliderInputWidget(
            label: 'Region Cost Index',
            value: _region,
            min: 60,
            max: 150,
            displayValue: '${_region.toInt()}%',
            onChanged: (v) => setState(() {
              _region = v;
              _calculate();
            }),
          ),
          const SizedBox(height: 20),
          SliderInputWidget(
            label: 'Industry Overhead',
            value: _overhead,
            min: 5,
            max: 40,
            displayValue: '${_overhead.toInt()}%',
            onChanged: (v) => setState(() {
              _overhead = v;
              _calculate();
            }),
          ),
        ],
      ),
    );
  }

  Widget _infoCards(BuildContext context) {
    final items = [
      {
        'icon': '📋',
        'title': 'Based on National Standards',
        'desc': 'Calculations follow Ministry of Labour guidelines.',
      },
      {
        'icon': '🔄',
        'title': 'Real-time Updates',
        'desc': 'Results update instantly as you adjust parameters.',
      },
      {
        'icon': '📊',
        'title': 'Regional Benchmarks',
        'desc': 'Region index reflects local cost of living data.',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.6,
      ),
      itemCount: items.length,
      itemBuilder: (context, i) {
        final item = items[i];
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: TC.surface2(context),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: TC.border(context)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item['icon']!, style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 8),
              Text(
                item['title']!,
                style: AppTextStyles.cardTitle(context).copyWith(fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(
                item['desc']!,
                style: AppTextStyles.bodySmall(context).copyWith(fontSize: 11),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}
