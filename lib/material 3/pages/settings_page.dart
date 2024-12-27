import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),

      body: Column(
        children: [
          Text(
            "Defaults",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500
            ),
            )
        ],
      ),
    );
  }
}