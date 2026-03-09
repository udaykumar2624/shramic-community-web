class RouteConstants {
  // Private constructor to prevent instantiation
  RouteConstants._();

  // Routes
  static const String home = '/';
  static const String metrics = '/metrics';
  static const String calculator = '/calculator';
  static const String pricingEngine = '/pricing-engine';
  static const String ecosystem = '/ecosystem';
  static const String stories = '/stories';
  static const String storyDetail = '/stories/:id';
  static const String personas = '/personas';
  static const String settings = '/settings';

  // Route Names (for go_router named navigation)
  static const String homeName = 'home';
  static const String metricsName = 'metrics';
  static const String calculatorName = 'calculator';
  static const String pricingEngineName = 'pricingEngine';
  static const String ecosystemName = 'ecosystem';
  static const String storiesName = 'stories';
  static const String storyDetailName = 'storyDetail';
  static const String personasName = 'personas';
  static const String settingsName = 'settings';
}
