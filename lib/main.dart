import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'features/home/home_page.dart';
import 'features/pricing_engine/pricing_page.dart';
import 'features/wage_calculator/calculator_page.dart';
import 'features/ecosystem/ecosystem_page.dart';
import 'features/impact_metrics/metrics_page.dart';
import 'features/success_stories/stories_page.dart';
import 'features/user_personas/personas_page.dart';
import 'providers/language_provider.dart';
import 'providers/theme_provider.dart';
import 'services/translation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TranslationService.load('en');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const AppRoot(), // ← AppRoot wraps CommunityApp
    ),
  );
}

// ── AppRoot listens to ThemeProvider safely ──────────────
class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return CommunityApp(themeMode: themeProvider.themeMode);
  }
}

// ── CommunityApp receives themeMode as param ─────────────
class CommunityApp extends StatelessWidget {
  final ThemeMode themeMode;

  const CommunityApp({
    super.key,
    required this.themeMode,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shramic Community',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/pricing': (context) => const PricingPage(),
        '/calculator': (context) => const CalculatorPage(),
        '/ecosystem': (context) => const EcosystemPage(),
        '/metrics': (context) => const MetricsPage(),
        '/stories': (context) => const StoriesPage(),
        '/personas': (context) => const PersonasPage(),
      },
    );
  }
}
