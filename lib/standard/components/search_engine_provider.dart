import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SearchEngine {
  qwant,
  google,
  duckduckgo,
  ecosia,
  brave,
  yahoo,
  bing
}

class SearchEngineProvider extends ChangeNotifier {
  static const String _engineKey = 'selected_engine';
  late SharedPreferences _prefs;
  SearchEngine _currentEngine = SearchEngine.qwant;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    final savedEngineIndex = _prefs.getInt(_engineKey) ?? 0;
    _currentEngine = SearchEngine.values[savedEngineIndex];
    notifyListeners();
  }

  // Save theme when it changes
  Future<void> setSearchEngine(SearchEngine engine) async {
    _currentEngine = engine;
    // Save theme index to SharedPreferences
    await _prefs.setInt(_engineKey, engine.index);
    notifyListeners();
  }

  String getSearchUrl(String query) {
    switch (_currentEngine) {
      case SearchEngine.qwant:
        return 'https://www.qwant.com/?l=en&q=$query&t=web';
      case SearchEngine.google:
        return 'https://www.google.com/search?q=$query';
      case SearchEngine.duckduckgo:
        return 'https://duckduckgo.com/?q=$query';
      case SearchEngine.ecosia:
        return 'https://www.ecosia.org/search?q=$query';
      case SearchEngine.brave:
        return 'https://search.brave.com/search?q=$query';
      case SearchEngine.yahoo:
        return 'https://search.yahoo.com/search?p=$query';
      case SearchEngine.bing:
        return 'https://www.bing.com/search?q=$query';
    }
  }

  String getSearchUrlStart() {
    switch (_currentEngine) {
      case SearchEngine.qwant:
        return 'https://www.qwant.com/';
      case SearchEngine.google:
        return 'https://www.google.com/';
      case SearchEngine.duckduckgo:
        return 'https://duckduckgo.com/';
      case SearchEngine.ecosia:
        return 'https://www.ecosia.org/';
      case SearchEngine.brave:
        return 'https://search.brave.com/';
      case SearchEngine.yahoo:
        return 'https://search.yahoo.com/';
      case SearchEngine.bing:
        return 'https://www.bing.com/';
    }
  }
}