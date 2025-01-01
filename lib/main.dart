import 'package:flutter/material.dart';
import 'package:myle/design_system_router.dart';
import 'package:myle/fluent%202/components/app_bar_fluent.dart';
import 'package:myle/material%203%20design/components/app_bar_material.dart';
import 'package:myle/standard/components/corner_provider.dart';
import 'package:myle/standard/components/search_engine_provider.dart';
import 'package:myle/standard/components/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeProvider = ThemeProvider();
  await themeProvider.initialize();
  final cornerProvider = CornerProvider();
  await cornerProvider.initialize();
  final searchEngineProvider = SearchEngineProvider();
  await searchEngineProvider.initialize();
  final styleProvider = StyleProvider();
  await styleProvider.initialize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => themeProvider,),
      ChangeNotifierProvider(create: (context) => searchEngineProvider),
      ChangeNotifierProvider(create: (context) => cornerProvider,),
      ChangeNotifierProvider(create: (context) => styleProvider,),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Myle',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: Provider.of<StyleProvider>(context, listen: false).getStyle(),
    );
  }
}