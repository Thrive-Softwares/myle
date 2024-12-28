import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myle/material%203/components/browser_tab.dart';

class TabOverviewPage extends StatelessWidget {
  final List<BrowserTab> tabs;
  final BrowserTab currentTab;
  final Function(BrowserTab) onTabSelected;
  final Function(BrowserTab) onTabClosed;
  final VoidCallback onNewTabPressed;

  const TabOverviewPage({
    Key? key,
    required this.tabs,
    required this.currentTab,
    required this.onTabSelected,
    required this.onTabClosed,
    required this.onNewTabPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabs (${tabs.length})'),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.add_square),
            onPressed: () {
              onNewTabPressed();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          final tab = tabs[index];
          return _buildTabCard(context, tab);
        },
      ),
    );
  }

  Widget _buildTabCard(BuildContext context, BrowserTab tab) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      elevation: 0,
      child: InkWell(
        onTap: () {
          onTabSelected(tab);
          Navigator.pop(context);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 120,
                  width: double.infinity,
                  child: Icon(Iconsax.global, size: 48, color: Theme.of(context).colorScheme.inversePrimary),
                ),
                if (tab.isLoading)
                  const Positioned(
                    top: 8,
                    right: 8,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      if (tabs.length > 1) {
                        onTabClosed(tab);
                        if (tab == currentTab) {
                          Navigator.pop(context);
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tab.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    tab.url,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}