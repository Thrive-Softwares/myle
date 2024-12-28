import 'package:flutter/material.dart';
import 'package:myle/standard/components/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeType {
  light,
  dark,
  blue,
  forest,
  cozy
}

class ThemeProvider extends ChangeNotifier {
  static const String _themeKey = 'selected_theme';
  late SharedPreferences _prefs;
  ThemeType _currentTheme = ThemeType.light;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    // Load saved theme type or use default (light)
    final savedThemeIndex = _prefs.getInt(_themeKey) ?? 0;
    _currentTheme = ThemeType.values[savedThemeIndex];
    notifyListeners();
  }
  
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
      case ThemeType.cozy:
        return cozy;
    }
  }
  
  ThemeType get currentThemeType => _currentTheme;
  
  // Save theme when it changes
  Future<void> setTheme(ThemeType theme) async {
    _currentTheme = theme;
    // Save theme index to SharedPreferences
    await _prefs.setInt(_themeKey, theme.index);
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
        _currentTheme = ThemeType.cozy;
        break;
      case ThemeType.cozy:
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
  bool get isCozyMode => _currentTheme == ThemeType.cozy;
}