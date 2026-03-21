import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/theme_colors.dart';
import '../../models/persona_model.dart';
import '../../providers/language_provider.dart';
import '../../services/mock_data_service.dart';
import '../../services/translation_service.dart';
import '../home/widgets/nav_bar.dart';

class PersonasPage extends StatefulWidget {
  const PersonasPage({super.key});

  @override
  State<PersonasPage> createState() => _PersonasPageState();
}

class _PersonasPageState extends State<PersonasPage> {
  int? _selected;
  final personas = MockDataService.getPersonas();

  final List<Color> _colors = [
    AppColors.accent,
    AppColors.accentRed,
    AppColors.accentBlue,
    AppColors.accentYellow,
  ];

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
                      center: Alignment(-0.3, -0.5),
                      radius: 1.0,
                      colors: [
                        Color(0x108AB4FF),
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
                        TranslationService.t('personas_label').toUpperCase(),
                        style: AppTextStyles.label(context),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        TranslationService.t('personas_title'),
                        style: AppTextStyles.h1(context).copyWith(
                          fontSize: isMobile ? 32 : 48,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        TranslationService.t('personas_desc'),
                        style: AppTextStyles.bodyMedium(context),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 80,
                    vertical: 32,
                  ),
                  child: Column(
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isMobile ? 2 : 4,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.1,
                        ),
                        itemCount: personas.length,
                        itemBuilder: (context, i) {
                          final p = personas[i];
                          final color = _colors[i % _colors.length];
                          final isSelected = _selected == i;

                          return GestureDetector(
                            onTap: () => setState(
                              () => _selected = isSelected ? null : i,
                            ),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? TC.surface2(context)
                                    : TC.surface(context),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color:
                                      isSelected ? color : TC.border(context),
                                  width: isSelected ? 2 : 1,
                                ),
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                          color: color.withValues(alpha: 0.15),
                                          blurRadius: 20,
                                        ),
                                      ]
                                    : [],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    p.emoji,
                                    style: const TextStyle(fontSize: 40),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    p.name,
                                    style: AppTextStyles.cardTitle(context),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    p.title,
                                    style: AppTextStyles.cardSubtitle(context),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      if (_selected != null) ...[
                        const SizedBox(height: 24),
                        _DetailPanel(
                          persona: personas[_selected!],
                          color: _colors[_selected! % _colors.length],
                          onClose: () => setState(() => _selected = null),
                        ),
                      ],
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
}

class _DetailPanel extends StatelessWidget {
  final PersonaModel persona;
  final Color color;
  final VoidCallback onClose;

  const _DetailPanel({
    required this.persona,
    required this.color,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: TC.surface(context),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.4)),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.08),
            blurRadius: 24,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                  border: Border.all(color: color.withValues(alpha: 0.4)),
                ),
                child: Center(
                  child: Text(
                    persona.emoji,
                    style: const TextStyle(fontSize: 26),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      persona.name,
                      style: AppTextStyles.h3(context),
                    ),
                    Text(
                      persona.title,
                      style: AppTextStyles.bodySmall(context),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onClose,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: TC.surface2(context),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: TC.border(context)),
                  ),
                  child: Icon(
                    Icons.close,
                    color: TC.textMuted(context),
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(height: 1, color: TC.border(context)),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.accentRed.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.accentRed.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              children: [
                const Text('⚠️', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    persona.painPoint,
                    style: AppTextStyles.bodySmall(context).copyWith(
                      color: AppColors.accentRed,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            persona.description,
            style: AppTextStyles.bodyMedium(context),
          ),
          const SizedBox(height: 20),
          Text(
            TranslationService.t('personas_needs').toUpperCase(),
            style: AppTextStyles.label(context).copyWith(fontSize: 10),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: persona.needs
                .map(
                  (n) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: color.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      '→ $n',
                      style: AppTextStyles.bodySmall(context).copyWith(
                        color: color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
