import 'package:flutter/material.dart';
import 'package:myle/standard/components/corner_provider.dart';
import 'package:myle/standard/components/search_engine_provider.dart';
import 'package:myle/standard/components/theme_provider.dart';
import 'package:myle/standard/components/app_bar.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeProvider = ThemeProvider();
  await themeProvider.initialize();
  final cornerProvider = CornerProvider();
  await cornerProvider.initialize();
  final searchEngineProvider = SearchEngineProvider();
  await searchEngineProvider.initialize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => themeProvider,),
      ChangeNotifierProvider(create: (context) => searchEngineProvider),
      ChangeNotifierProvider(create: (context) => cornerProvider,),
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
      home: const BrowserHome(),
    );
  }
}