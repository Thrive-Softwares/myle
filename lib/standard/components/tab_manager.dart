import 'dart:convert';

import 'package:myle/standard/components/browser_tab.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TabManager {
  static const String _storageKey = 'saved_tabs';
  
  // Save tabs to SharedPreferences
  static Future<void> saveTabs(List<BrowserTab> tabs) async {
    final prefs = await SharedPreferences.getInstance();
    final tabsData = tabs.map((tab) => tab.toJson()).toList();
    await prefs.setString(_storageKey, jsonEncode(tabsData));
  }
  
  // Load tabs from SharedPreferences
  static Future<List<BrowserTab>> loadTabs() async {
    final prefs = await SharedPreferences.getInstance();
    final tabsJson = prefs.getString(_storageKey);
    
    if (tabsJson != null) {
      final tabsData = jsonDecode(tabsJson) as List;
      return tabsData
          .map((tabData) => BrowserTab.fromJson(tabData as Map<String, dynamic>))
          .toList();
    }
    
    return [];
  }
}