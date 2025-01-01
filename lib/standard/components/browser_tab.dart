import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserTab {
  final String id;
  final WebViewController controller;
  String title;
  String url;
  bool isLoading;

  BrowserTab({
    required this.id,
    required this.controller,
    this.title = 'New Tab',
    this.url = '',
    this.isLoading = false,
  });

  // Convert tab to JSON for storage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'url': url,
    };
  }

  // Create tab from JSON data
  static BrowserTab fromJson(Map<String, dynamic> json) {
    final controller = WebViewController();
    final tab = BrowserTab(
      id: json['id'],
      controller: controller,
      title: json['title'],
      url: json['url'],
    );
    
    // Configure the controller
    if (tab.url.isNotEmpty) {
      controller
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(tab.url));
    }
    
    return tab;
  }
}