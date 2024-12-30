import 'package:flutter/material.dart';
import 'package:myle/material%203%20design/components/app_bar_material.dart';
import 'package:myle/standard/components/app_bar_standard.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Style {
  standard,
  material,
  nothing, 
  fluent,
}

class StyleProvider extends ChangeNotifier {
  static const String _styleKey = 'selected_style';
  late SharedPreferences _prefs;
  Style _currentStyle = Style.standard;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    final savedStyleIndex = _prefs.getInt(_styleKey) ?? 0;
    _currentStyle = Style.values[savedStyleIndex];
    notifyListeners();
  }

  // Save theme when it changes
  Future<void> setCornerRadius(Style style) async {
    _currentStyle = style;
    // Save theme index to SharedPreferences
    await _prefs.setInt(_styleKey, style.index);
    notifyListeners();
  }

  Object getCornerRadius() {
    switch (_currentStyle) {
      case Style.standard:
        return BrowserHomeStandard();
      case Style.material:
        return BrowserHomeMaterial();
      case Style.nothing:
        return 99;
      case Style.fluent:
        return 8;
    }
  }
}