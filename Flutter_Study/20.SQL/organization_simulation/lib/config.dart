class AppConfig {
  static const String appName = 'Organization Simulator';

  // false - path url strategy
  // true - hash url strategy
  static bool isUrlHashStrategy = false;

  // url appender for path strategy
  // used if application run not at /
  static String urlAppend = '';
}