import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum CornerRadius {
  rounded,
  rectangle,
  round
}

class CornerProvider extends ChangeNotifier {
  static const String _radiusKey = 'selected_radius';
  late SharedPreferences _prefs;
  CornerRadius _currentCornerRadius = CornerRadius.rounded;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    final savedRadiusIndex = _prefs.getInt(_radiusKey) ?? 0;
    _currentCornerRadius = CornerRadius.values[savedRadiusIndex];
    notifyListeners();
  }

  // Save theme when it changes
  Future<void> setCornerRadius(CornerRadius radius) async {
    _currentCornerRadius = radius;
    // Save theme index to SharedPreferences
    await _prefs.setInt(_radiusKey, radius.index);
    notifyListeners();
  }

  double getCornerRadius() {
    switch (_currentCornerRadius) {
      case CornerRadius.rectangle:
        return 0;
      case CornerRadius.rounded:
        return 12;
      case CornerRadius.round:
        return 99;
    }
  }
}