import 'package:flutter/material.dart';
import 'package:myle/material%203/components/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = darkMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == lightMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == darkMode) {
       themeData = lightMode;
    } else {
       themeData = darkMode;
    }
  }
}