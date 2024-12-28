

import 'package:flutter/material.dart';
import 'package:myle/standard/components/theme.dart';

enum ThemeType {
  light,
  dark,
  blue,
  forest
}

class ThemeProvider extends ChangeNotifier {
  ThemeType _currentTheme = ThemeType.light;
  
  // Get current theme data
  ThemeData get themeData {
    switch (_currentTheme) {
      case ThemeType.light:
        return lightMode;
      case ThemeType.dark:
        return darkMode;
      case ThemeType.blue:
        return blue;
      case ThemeType.forest:
        return forest;
    }
  }
  
  // Get current theme type
  ThemeType get currentThemeType => _currentTheme;
  
  // Set theme using enum
  void setTheme(ThemeType theme) {
    _currentTheme = theme;
    notifyListeners();
  }
  
  // Cycle through themes
  void cycleTheme() {
    switch (_currentTheme) {
      case ThemeType.light:
        _currentTheme = ThemeType.dark;
        break;
      case ThemeType.dark:
        _currentTheme = ThemeType.blue;
        break;
      case ThemeType.blue:
        _currentTheme = ThemeType.forest;
        break;
      case ThemeType.forest:
        _currentTheme = ThemeType.light;
        break;
    }
    notifyListeners();
  }
  
  // Helper methods to check current theme
  bool get isLightMode => _currentTheme == ThemeType.light;
  bool get isDarkMode => _currentTheme == ThemeType.dark;
  bool get isCustomMode => _currentTheme == ThemeType.blue;
  bool get isForestMode => _currentTheme == ThemeType.forest;
}