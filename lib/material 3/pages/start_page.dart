import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Function(String) onUrlSelected;

  const HomePage({super.key, required this.onUrlSelected});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome to Myle',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          // Quick access links
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _QuickAccessButton(
                icon: Icons.search_rounded,
                label: 'Qwant',
                url: 'https://www.qwant.com',
                onTap: onUrlSelected,
              ),
              _QuickAccessButton(
                icon: Icons.newspaper_rounded,
                label: 'Tech news',
                url: 'https://www.theverge.com/',
                onTap: onUrlSelected,
              ),
              _QuickAccessButton(
                icon: Icons.email_rounded,
                label: 'Gmail',
                url: 'https://mail.google.com',
                onTap: onUrlSelected,
              ),
              _QuickAccessButton(
                icon: Icons.play_circle_rounded,
                label: 'YouTube',
                url: 'https://www.youtube.com',
                onTap: onUrlSelected,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickAccessButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;
  final Function(String) onTap;

  const _QuickAccessButton({
    required this.icon,
    required this.label,
    required this.url,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(url),
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        child: Column(
          children: [
            Icon(icon, size: 32),
            const SizedBox(height: 8),
            Text(label),
          ],
        ),
      ),
    );
  }
}