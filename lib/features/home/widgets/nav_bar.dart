import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/theme_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../providers/language_provider.dart';
import '../../../providers/theme_provider.dart';
import '../../../services/translation_service.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _hoveredNav = -1;

  final List<String> _routes = [
    '/',
    '/metrics',
    '/calculator',
    '/ecosystem',
    '/stories',
    '/personas',
  ];

  void _navigate(int index) {
    if (index >= _routes.length) return;
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final targetRoute = _routes[index];
    if (currentRoute == targetRoute) return;
    Navigator.pushReplacementNamed(context, targetRoute);
  }

  Future<void> _switchLanguage(
    LanguageProvider langProvider,
    int index,
  ) async {
    langProvider.setLanguage(index);
    await TranslationService.load(langProvider.languages[index]['code']!);
    if (mounted) {
      Navigator.pushReplacementNamed(
        context,
        ModalRoute.of(context)?.settings.name ?? '/',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final langProvider = Provider.of<LanguageProvider>(context, listen: true);
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 40,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.bg.withValues(alpha: 0.92)
            : AppColors.lightBg.withValues(alpha: 0.92),
        border: Border(
          bottom: BorderSide(color: TC.border(context)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
            child: Text(
              'FairWork',
              style: AppTextStyles.h3(context).copyWith(
                color: AppColors.accent,
                fontSize: 18,
              ),
            ),
          ),

          // Desktop Navigation
          if (!isMobile)
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  AppConstants.navItems.length,
                  (i) => MouseRegion(
                    onEnter: (_) => setState(() => _hoveredNav = i),
                    onExit: (_) => setState(() => _hoveredNav = -1),
                    child: GestureDetector(
                      onTap: () => _navigate(i),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: AppTextStyles.navLink(context).copyWith(
                            color: _hoveredNav == i
                                ? AppColors.accent
                                : TC.textMuted(context),
                          ),
                          child: Text(AppConstants.navItems[i]['label']!),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          if (isMobile) const Spacer(),

          // Right side controls
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Dark/Light toggle
              GestureDetector(
                onTap: themeProvider.toggleTheme,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 40,
                  height: 22,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: TC.surface2(context),
                    borderRadius: BorderRadius.circular(11),
                    border: Border.all(color: TC.border(context)),
                  ),
                  child: Row(
                    mainAxisAlignment: isDark
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 14,
                        height: 14,
                        decoration: const BoxDecoration(
                          color: AppColors.accent,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            isDark ? '🌙' : '☀️',
                            style: const TextStyle(fontSize: 8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // Language toggle — only show on desktop, mobile uses bottom sheet
              if (!isMobile)
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: TC.surface2(context),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      langProvider.languages.length,
                      (i) => GestureDetector(
                        onTap: () => _switchLanguage(langProvider, i),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 3,
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
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              // Mobile menu icon
              if (isMobile) ...[
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => _showMobileMenu(context),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: TC.surface2(context),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: TC.border(context)),
                    ),
                    child: Icon(
                      Icons.menu,
                      color: TC.textPrimary(context),
                      size: 18,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    final langProvider = Provider.of<LanguageProvider>(context, listen: false);
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      backgroundColor: TC.surface(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: TC.border(context),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),

            // Theme + Language row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Theme toggle
                GestureDetector(
                  onTap: () {
                    themeProvider.toggleTheme();
                    Navigator.pop(sheetContext);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: TC.surface2(context),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: TC.border(context)),
                    ),
                    child: Text(
                      isDark ? '☀️ Light' : '🌙 Dark',
                      style: AppTextStyles.bodySmall(context),
                    ),
                  ),
                ),

                // Language buttons
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    langProvider.languages.length,
                    (i) => GestureDetector(
                      onTap: () async {
                        Navigator.pop(sheetContext);
                        await _switchLanguage(langProvider, i);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: langProvider.selectedIndex == i
                              ? AppColors.accent
                              : TC.surface2(context),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: TC.border(context)),
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
              ],
            ),

            const SizedBox(height: 16),
            Container(height: 1, color: TC.border(context)),
            const SizedBox(height: 8),

            // Nav items
            ...List.generate(
              AppConstants.navItems.length,
              (i) => ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  AppConstants.navItems[i]['label']!,
                  style: AppTextStyles.bodyLarge(context),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
                  color: TC.textMuted(context),
                ),
                onTap: () {
                  Navigator.pop(sheetContext);
                  _navigate(i);
                },
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
