import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:myle/standard/components/search_engine_provider.dart';
import 'package:provider/provider.dart';

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
                icon: FluentSystemIcons.ic_fluent_search_regular,
                label: 'Search',
                url: Provider.of<SearchEngineProvider>(context, listen: false).getSearchUrlStart(),
                onTap: onUrlSelected,
              ),
              _QuickAccessButton(
                icon: FluentSystemIcons.ic_fluent_news_regular,
                label: 'Tech news',
                url: 'https://www.theverge.com/',
                onTap: onUrlSelected,
              ),
              _QuickAccessButton(
                icon: FluentSystemIcons.ic_fluent_mail_regular,
                label: 'Gmail',
                url: 'https://mail.google.com',
                onTap: onUrlSelected,
              ),
              _QuickAccessButton(
                icon: FluentSystemIcons.ic_fluent_play_circle_regular,
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
          border: Border.all(color: Theme.of(context).colorScheme.tertiary),
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.secondary,
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