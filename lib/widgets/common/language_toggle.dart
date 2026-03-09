import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/theme_colors.dart';
import '../../providers/language_provider.dart';
import '../../services/translation_service.dart';

class LanguageToggle extends StatelessWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, langProvider, _) {
        return Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: TC.surface2(context),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              langProvider.languages.length,
              (i) => GestureDetector(
                onTap: () async {
                  langProvider.setLanguage(i);
                  await TranslationService.load(
                    langProvider.languages[i]['code']!,
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: langProvider.selectedIndex == i
                        ? AppColors.accent
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    langProvider.languages[i]['label']!,
                    style: AppTextStyles.bodySmall(context).copyWith(
                      color: langProvider.selectedIndex == i
                          ? AppColors.bg
                          : TC.textMuted(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
