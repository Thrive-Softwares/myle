import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myle/material%203/components/browser_tab.dart';
import 'package:myle/material%203/pages/settings_page.dart';
import 'package:myle/material%203/pages/start_page.dart';
import 'package:myle/material%203/pages/tabs_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class BrowserHome extends StatefulWidget {
  const BrowserHome({super.key});

  @override
  State<BrowserHome> createState() => _BrowserHomeState();
}

class _BrowserHomeState extends State<BrowserHome> {
  SampleItem? selectedItem;
  late WebViewController controller;
  List<BrowserTab> tabs = [];
  late BrowserTab currentTab; 
  final urlController = TextEditingController();
  bool isLoading = false;
  bool showHomePage = true;
  bool showMenu = false;
  bool isSearchBarFocused = false;

  @override
    void initState() {
      super.initState();
      _createNewTab();
    }

  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  void _createNewTab() {
  // Create the controller first
  WebViewController newController = WebViewController(); 
  
  // Create the tab with the controller
  final newTab = BrowserTab(
    id: DateTime.now().millisecondsSinceEpoch.toString(),
    controller: newController,
  );

  // Add the tab to our list and make it current
  setState(() {
    tabs.add(newTab);
    currentTab = newTab;
  });

  // Configure the controller after the tab is created
  newController
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(NavigationDelegate(
      onPageStarted: (url) {
        setState(() {
          currentTab.isLoading = true;
          currentTab.url = url;
          showHomePage = false;
        });
      },
      onPageFinished: (url) {
        setState(() {
          currentTab.isLoading = false;
        });
        newController.getTitle().then((title) {
          if (title != null) {
            setState(() {
              currentTab.title = title;
            });
          }
        });
      },
    ));
}

void _closeTab(BrowserTab tab) {
  if (tabs.length > 1) {
    setState(() {
      final index = tabs.indexOf(tab);
      tabs.remove(tab);
      if (tab == currentTab) {
        currentTab = tabs[index > 0 ? index - 1 : 0];
      }
    });
  }
}

void _switchTab(BrowserTab tab) {
  setState(() {
    currentTab = tab;
    showHomePage = false;
  });
}

  bool isValidUrl(String url) {
    final commonTlds = [
      '.com', '.net', '.org', '.gov', '.edu', 
      '.us', '.de', '.uk', '.app', '.ai', 
      '.co', '.io', '.tech', '.xyz', '.dev',
      '.cv', '.design', '.cloud', '.ca', '.me',
      '.co.uk', '.co.de', '.co.nz', '.co.uk',
      '.co.in', '.co.jp', '.co.kr', '.co.id',
      '.one', '.mobi', '.name', '.online',
      '.top', '.world', '.biz', '.info',
      '.eu', '.blog', '.press', '.museum',
      '.shop', '.pro', '.site', '.club',
      '.jobs', '.social', '.network',
      '.fun', '.online', '.store', '.media',
      '.audio', '.tv', '.in', '.ly',
    ];
    
    return url.startsWith('http') || 
           url.startsWith('www.') ||
           commonTlds.any((tld) => url.endsWith(tld));
  }

  void loadUrl(String url) {
  if (url.isNotEmpty) {
    if (isValidUrl(url)) {
      final uri = Uri.parse(url.startsWith('http') ? url : 'https://$url');
      currentTab.controller.loadRequest(uri);
    } else {
      final uri = Uri.parse('https://www.qwant.com/?l=en&q=$url&t=web');
      currentTab.controller.loadRequest(uri);
    }
  }
  setState(() {
    isSearchBarFocused = false;
  });
}

  Widget _buildSearchBar({bool floating = false}) {
    return GestureDetector(
      onTapDown: (_) {
        if (!floating) {
          setState(() {
            isSearchBarFocused = true;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: TextField(
          controller: urlController,
          autofocus: floating,
          onTap: () {
            if (!floating) {
              setState(() {
                isSearchBarFocused = true;
              });
            }
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(top: 10, left: 15),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            hintText: 'Begin your journey',
            suffixIcon: IconButton(
              icon: const Icon(Icons.search_rounded),
              onPressed: () => loadUrl(urlController.text),
            ),
          ),
          onSubmitted: loadUrl,
        ),
      ),
    );
  }

/*
  Widget _buildTabBar() {
  return Container(
    height: 40,
    color: Theme.of(context).colorScheme.secondary,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: tabs.length + 1, // +1 for new tab button
      itemBuilder: (context, index) {
        if (index == tabs.length) {
          return IconButton(
            icon: const Icon(Iconsax.add_square),
            onPressed: _createNewTab,
          );
        }

        final tab = tabs[index];
        return GestureDetector(
          onTap: () => _switchTab(tab),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: tab == currentTab 
                ? Theme.of(context).colorScheme.tertiary
                : Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 8),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 120),
                  child: Text(
                    tab.title,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (tab.isLoading)
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                else
                  IconButton(
                    icon: const Icon(Icons.close, size: 16),
                    onPressed: () => _closeTab(tab),
                  ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
*/

  Widget _buildNavigationControls() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8),
    color: Theme.of(context).colorScheme.secondary,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(Iconsax.arrow_left_2),
          onPressed: () => currentTab.controller.goBack(),
        ),
        IconButton(
          icon: const Icon(Iconsax.arrow_right_3),
          onPressed: () => currentTab.controller.goForward(),
        ),
        IconButton(
          icon: const Icon(Iconsax.home_2),
          onPressed: () => setState(() => showHomePage = true),
        ),
        IconButton(
          icon: const Icon(Iconsax.add_square),
          onPressed: () => _createNewTab(),
        ),
        IconButton(
          icon: const Icon(Iconsax.square),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => TabOverviewPage(
          tabs: tabs,
          currentTab: currentTab,
          onTabSelected: (tab) => setState(() {
            _switchTab(tab);
          }),
          onTabClosed: (tab) => setState(() {
            _closeTab(tab);
          }),
          onNewTabPressed: _createNewTab,
        ),));
          },
        ),
        _buildMenuButton(),
      ],
    ),
  );
}

  Widget _buildMenuButton() {
    return PopupMenuButton<SampleItem>(
      color: Theme.of(context).colorScheme.tertiary,
      elevation: 0,
      initialValue: selectedItem,
      onSelected: (SampleItem item) {
        setState(() {
          selectedItem = item;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemOne,
          child: const Row(
            children: [
              Icon(Iconsax.refresh_left_square),
              SizedBox(width: 10),
              Text('Refresh'),
            ],
          ),
          onTap: () {
            controller.reload();
          },
        ),
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemTwo,
          child: const Row(
            children: [
              Icon(Iconsax.setting_2),
              SizedBox(width: 10),
              Text('Settings'),
            ],
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsPage()));
          },
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemThree,
          child: Row(
            children: [
              Icon(Iconsax.share),
              SizedBox(width: 10),
              Text('Share'),
            ],
          ),
        ),
      ],
    );
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    resizeToAvoidBottomInset: false,
    body: Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Stack(
        children: [
          if (showHomePage)
            HomePage(onUrlSelected: loadUrl)
          else
            WebViewWidget(controller: currentTab.controller),
          if (currentTab.isLoading)
            const LinearProgressIndicator(),
          if (isSearchBarFocused)
            Positioned(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 0,
              right: 0,
              child: _buildSearchBar(floating: true),
            ),
        ],
      ),
    ),
    bottomNavigationBar: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // _buildTabBar(),
        if (!isSearchBarFocused) _buildSearchBar(),
        _buildNavigationControls(),
      ],
    ),
  );
}
}