import 'package:flutter/material.dart';
import 'package:myle/material%203/components/theme.dart';
import 'package:myle/material%203/components/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.all(25),
                padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Light Mode",
                  ),
                Switch(
                  value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode, 
                  onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
                  ),
              ],
            ),
          ),

          Divider(
            height: 20,
            indent: 45,
            endIndent: 45,
          ),
          TextButton(
            onPressed: () {

            }, 
            child: Text(
              "Git Repository", 
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,),
              ),
            ),

            GestureDetector(
              onTap: () {

              },
                child: Text(
                  'Support me',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
            ),
        ],
      ),
    );
  }
}