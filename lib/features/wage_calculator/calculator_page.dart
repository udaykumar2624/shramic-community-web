import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/theme_colors.dart';
import '../../providers/language_provider.dart';
import '../../services/translation_service.dart';
import '../home/widgets/nav_bar.dart';
import '../pricing_engine/widgets/slider_input_widget.dart';
import 'calculator_controller.dart';
import 'widgets/result_display_widget.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    context.watch<LanguageProvider>();
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
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 80,
                    vertical: 48,
                  ),
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(0.5, -0.5),
                      radius: 1.0,
                      colors: [
                        Color(0x10FFCD3D),
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
                              TranslationService.t('back'),
                              style: AppTextStyles.bodySmall(context),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        TranslationService.t('calculator_label').toUpperCase(),
                        style: AppTextStyles.label(context),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        TranslationService.t('calculator_title'),
                        style: AppTextStyles.h1(context).copyWith(
                          fontSize: isMobile ? 32 : 48,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: isMobile ? double.infinity : 560,
                        child: Text(
                          TranslationService.t('calculator_desc'),
                          style: AppTextStyles.bodyMedium(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 80,
                    vertical: 40,
                  ),
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, _) {
                      return isMobile
                          ? Column(
                              children: [
                                _inputSection(context, isMobile),
                                const SizedBox(height: 24),
                                ResultDisplayWidget(
                                  result: _controller.result,
                                ),
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: _inputSection(context, isMobile),
                                ),
                                const SizedBox(width: 32),
                                Expanded(
                                  flex: 4,
                                  child: ResultDisplayWidget(
                                    result: _controller.result,
                                  ),
                                ),
                              ],
                            );
                    },
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

  Widget _inputSection(BuildContext context, bool isMobile) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(24),
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
                      color: AppColors.accentYellow.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.category_outlined,
                      color: AppColors.accentYellow,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    TranslationService.t('calculator_select_category'),
                    style: AppTextStyles.h3(context),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                TranslationService.t('calculator_industry').toUpperCase(),
                style: AppTextStyles.label(context).copyWith(
                  color: TC.textMuted(context),
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 8),
              _buildDropdown(
                context: context,
                value: _controller.selectedIndustry,
                items: _controller.industries,
                onChanged: (v) => _controller.updateIndustry(v!),
              ),
              const SizedBox(height: 20),
              Text(
                TranslationService.t('calculator_state').toUpperCase(),
                style: AppTextStyles.label(context).copyWith(
                  color: TC.textMuted(context),
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 8),
              _buildDropdown(
                context: context,
                value: _controller.selectedState,
                items: _controller.states,
                onChanged: (v) => _controller.updateState(v!),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(24),
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
                  Text(
                    TranslationService.t('calculator_work_params'),
                    style: AppTextStyles.h3(context),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: _controller.reset,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: TC.surface2(context),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: TC.border(context)),
                      ),
                      child: Text(
                        TranslationService.t('reset'),
                        style: AppTextStyles.bodySmall(context).copyWith(
                          color: TC.textMuted(context),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SliderInputWidget(
                label: TranslationService.t('calculator_hours'),
                value: _controller.hours,
                min: 20,
                max: 60,
                displayValue: '${_controller.hours.toInt()} hrs',
                onChanged: _controller.updateHours,
              ),
              const SizedBox(height: 20),
              SliderInputWidget(
                label: TranslationService.t('calculator_skill'),
                value: _controller.skill,
                min: 1,
                max: 10,
                displayValue: '${_controller.skill.toInt()} / 10',
                onChanged: _controller.updateSkill,
              ),
              const SizedBox(height: 20),
              SliderInputWidget(
                label: TranslationService.t('calculator_region'),
                value: _controller.region,
                min: 60,
                max: 150,
                displayValue: '${_controller.region.toInt()}%',
                onChanged: _controller.updateRegion,
              ),
              const SizedBox(height: 20),
              SliderInputWidget(
                label: TranslationService.t('calculator_overhead'),
                value: _controller.overhead,
                min: 5,
                max: 40,
                displayValue: '${_controller.overhead.toInt()}%',
                onChanged: _controller.updateOverhead,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: TC.surface2(context),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: TC.border(context)),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                color: TC.textMuted(context),
                size: 16,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  TranslationService.t('calculator_min_wage_note').replaceAll(
                    '{status}',
                    _controller.result.isFairLabourCompliant
                        ? TranslationService.t('above')
                        : TranslationService.t('below'),
                  ),
                  style: AppTextStyles.bodySmall(context),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required BuildContext context,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: TC.surface2(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: TC.border(context)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          dropdownColor: TC.surface2(context),
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: TC.textMuted(context),
          ),
          style: AppTextStyles.bodyMedium(context).copyWith(
            color: TC.textPrimary(context),
          ),
          items: items
              .map(
                (item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
