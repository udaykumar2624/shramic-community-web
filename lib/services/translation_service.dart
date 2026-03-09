import 'dart:convert';
import 'package:flutter/services.dart';

class TranslationService {
  static Map<String, String> _strings = {};
  static String _currentCode = 'en';

  static Future<void> load(String languageCode) async {
    _currentCode = languageCode;
    final jsonString = await rootBundle.loadString(
      'assets/translations/$languageCode.json',
    );
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    _strings = jsonMap.map(
      (key, value) => MapEntry(key, value.toString()),
    );
  }

  static String t(String key) {
    return _strings[key] ?? key;
  }

  static String get currentCode => _currentCode;
}
