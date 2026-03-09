import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  final List<Map<String, String>> languages = [
    {'code': 'en', 'label': 'EN', 'name': 'English'},
    {'code': 'hi', 'label': 'हि', 'name': 'Hindi'},
    {'code': 'kn', 'label': 'ಕ', 'name': 'Kannada'},
  ];

  int get selectedIndex => _selectedIndex;
  String get currentCode => languages[_selectedIndex]['code']!;
  String get currentLabel => languages[_selectedIndex]['label']!;
  String get currentName => languages[_selectedIndex]['name']!;

  void setLanguage(int index) {
    if (index == _selectedIndex) return;
    _selectedIndex = index;
    notifyListeners();
  }
}
