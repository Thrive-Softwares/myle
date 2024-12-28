import 'package:flutter/material.dart';

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
  SearchEngine _currentEngine = SearchEngine.qwant;

  SearchEngine get currentEngine => _currentEngine;

  void setSearchEngine(SearchEngine engine) {
    _currentEngine = engine;
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
}