import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/theme_colors.dart';
import '../../../services/translation_service.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
    _fadeAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;

    return FadeTransition(
      opacity: _fadeAnim,
      child: SlideTransition(
        position: _slideAnim,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 80,
            vertical: isMobile ? 80 : 120,
          ),
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0.6, -0.2),
              radius: 1.2,
              colors: [
                Color(0x143DFFA0),
                Colors.transparent,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tag
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: TC.surface2(context),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: TC.border(context)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: AppColors.accent,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      TranslationService.t('hero_tag'),
                      style: AppTextStyles.label(context),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Headline
              RichText(
                text: TextSpan(
                  style: AppTextStyles.h1(context).copyWith(
                    fontSize: isMobile ? 36 : 56,
                  ),
                  children: [
                    TextSpan(
                      text: '${TranslationService.t('hero_title_1')}\n',
                    ),
                    TextSpan(
                      text: TranslationService.t('hero_title_2'),
                      style: const TextStyle(color: AppColors.accent),
                    ),
                    TextSpan(
                      text: '\n${TranslationService.t('hero_title_3')}',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Description
              SizedBox(
                width: isMobile ? double.infinity : 520,
                child: Text(
                  TranslationService.t('hero_desc'),
                  style: AppTextStyles.bodyLarge(context).copyWith(
                    color: TC.textMuted(context),
                  ),
                ),
              ),

              const SizedBox(height: 36),

              // Buttons — theme-aware, no hardcoded colors
              Wrap(
                spacing: 16,
                runSpacing: 12,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/pricing'),
                    child: Text(
                      TranslationService.t('hero_btn_calculator'),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () => Navigator.pushNamed(context, '/ecosystem'),
                    child: Text(
                      TranslationService.t('hero_btn_ecosystem'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60),

              // Stats Row
              if (!isMobile)
                Row(
                  children: [
                    _statItem(
                      context,
                      '48,200+',
                      TranslationService.t('stats_workers'),
                    ),
                    _divider(context),
                    _statItem(
                      context,
                      '₹12 Cr+',
                      TranslationService.t('stats_wages'),
                    ),
                    _divider(context),
                    _statItem(
                      context,
                      '18',
                      TranslationService.t('stats_states'),
                    ),
                    _divider(context),
                    _statItem(
                      context,
                      '320+',
                      TranslationService.t('stats_orgs'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statItem(BuildContext context, String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: AppTextStyles.metricMedium(context)),
        const SizedBox(height: 4),
        Text(label, style: AppTextStyles.bodySmall(context)),
      ],
    );
  }

  Widget _divider(BuildContext context) {
    return Container(
      height: 40,
      width: 1,
      margin: const EdgeInsets.symmetric(horizontal: 32),
      color: TC.border(context),
    );
  }
}
