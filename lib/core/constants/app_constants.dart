class AppConstants {
  // App Info
  static const String appName = 'Shramic Community';
  static const String appVersion = '1.0.0';
  static const String appTagline = 'Fair Pay. Real Impact. Real Change.';

  // API (mock for now)
  static const String baseUrl = 'https://api.shramic.org';
  static const int apiTimeout = 30; // seconds

  // Wage Calculator
  static const double minBaseHours = 20;
  static const double maxBaseHours = 60;
  static const double defaultBaseHours = 40;

  static const double minSkillLevel = 1;
  static const double maxSkillLevel = 10;
  static const double defaultSkillLevel = 5;

  static const double minRegionIndex = 60;
  static const double maxRegionIndex = 150;
  static const double defaultRegionIndex = 100;

  static const double minOverhead = 5;
  static const double maxOverhead = 40;
  static const double defaultOverhead = 20;

  static const double baseRatePerHour = 300; // ₹ per hour
  static const double skillBonusPerLevel = 500; // ₹ per skill level
  static const double minimumFairWage = 15000; // ₹ per month

  // Impact Metrics
  static const int workersProtected = 48200;
  static const int fairWagesCrores = 12;
  static const int organizationsUsing = 320;
  static const int statesCovered = 18;

  // Pagination
  static const int storiesPerPage = 6;
  static const int metricsPerRow = 4;

  // Animation Durations
  static const int counterAnimDuration = 2000; // ms
  static const int fadeAnimDuration = 600; // ms
  static const int slideAnimDuration = 400; // ms
  static const int hoverAnimDuration = 200; // ms

  // Responsive Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  // Spacing
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXL = 40.0;
  static const double paddingXXL = 80.0;

  // Border Radius
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;
  static const double radiusXL = 20.0;
  static const double radiusRound = 100.0;

  // Languages
  static const List<Map<String, String>> supportedLanguages = [
    {'code': 'en', 'label': 'EN', 'name': 'English'},
    {'code': 'hi', 'label': 'हि', 'name': 'Hindi'},
    {'code': 'kn', 'label': 'ಕ', 'name': 'Kannada'},
  ];
  // Nav Items
  static const List<Map<String, String>> navItems = [
    {'label': 'Home', 'route': '/'},
    {'label': 'Metrics', 'route': '/metrics'},
    {'label': 'Calculator', 'route': '/calculator'},
    {'label': 'Ecosystem', 'route': '/ecosystem'},
    {'label': 'Stories', 'route': '/stories'},
    {'label': 'Personas', 'route': '/personas'},
  ];
}
