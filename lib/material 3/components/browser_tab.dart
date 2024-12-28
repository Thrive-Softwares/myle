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
}