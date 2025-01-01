import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myle/standard/components/browser_tab.dart';
import 'package:myle/standard/components/corner_provider.dart';
import 'package:myle/standard/components/search_engine_provider.dart';
import 'package:myle/standard/components/tab_manager.dart';
import 'package:myle/standard/pages/settings_page.dart';
import 'package:myle/standard/pages/start_page.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class BrowserHomeStandard extends StatefulWidget {
  const BrowserHomeStandard({super.key});

  @override
  State<BrowserHomeStandard> createState() => _BrowserHomeStandardState();
}

class _BrowserHomeStandardState extends State<BrowserHomeStandard> {
  static const platform = MethodChannel('com.yourdomain.browser/default_browser');
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
    controller = WebViewController();
    _loadSavedTabs();
    _createNewTab();
    _setupMethodChannel();
  }

  Future<void> _loadSavedTabs() async {
  final savedTabs = await TabManager.loadTabs();
  setState(() {
    if (savedTabs.isEmpty) {
      _createNewTab();
    } else {
      tabs = savedTabs;
      currentTab = tabs.first;
    }
  });
}

Future<void> _saveTabs() async {
  await TabManager.saveTabs(tabs);
}

  void _setupMethodChannel() {
    platform.setMethodCallHandler((call) async {
      if (call.method == 'loadUrl') {
        final url = call.arguments as String;
        _handleIncomingUrl(url);
      }
      return null;
    });
  }

  void _handleIncomingUrl(String url) {
    setState(() {
      showHomePage = false;
      isSearchBarFocused = false;
    });
    
    if (url.isNotEmpty) {
      urlController.text = url;
      loadUrl(url);
    }
  }

  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  void sharePressed() {
    String link = currentTab.url;
      Share.share(link);
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
    isSearchBarFocused = false; // Reset focus when creating new tab
  });
  _saveTabs();

  // Configure the controller after the tab is created
  newController
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(NavigationDelegate(
      onPageStarted: (url) {
        setState(() {
          currentTab.isLoading = true;
          currentTab.url = url;
          showHomePage = false;
          isSearchBarFocused = false; // Reset focus when navigation starts
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
    _saveTabs();
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
      currentTab.url = uri.toString(); // Add this line
    } else {
      final searchUrl = Provider.of<SearchEngineProvider>(context, listen: false)
          .getSearchUrl(url);
      final uri = Uri.parse(searchUrl);
      currentTab.controller.loadRequest(uri);
      currentTab.url = uri.toString(); // Add this line
    }
    _saveTabs(); // Add this line
  }
  setState(() {
    isSearchBarFocused = false;
  });
  FocusScope.of(context).unfocus();
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
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(Provider.of<CornerProvider>(context, listen: false).getCornerRadius(),), borderSide: BorderSide.none),
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
            margin: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
            decoration: BoxDecoration(
              color: tab == currentTab 
                ? Theme.of(context).colorScheme.tertiary
                : Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(Provider.of<CornerProvider>(context, listen: false).getCornerRadius(),),
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

  Widget _buildNavigationControls() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8),
    color: Theme.of(context).colorScheme.secondary,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(Iconsax.arrow_left_2),
          onPressed: () {
            currentTab.controller.goBack();
            setState(() {
              isSearchBarFocused = false; // Reset focus when going back
            });
            FocusScope.of(context).unfocus(); // Actively unfocus
          },
        ),
        IconButton(
          icon: const Icon(Iconsax.arrow_right_3),
          onPressed: () {
            currentTab.controller.goForward();
            setState(() {
              isSearchBarFocused = false; // Reset focus when going forward
            });
            FocusScope.of(context).unfocus(); // Actively unfocus
          },
        ),
        IconButton(
          icon: const Icon(Iconsax.home_2),
          onPressed: () {
            setState(() {
              showHomePage = true;
              isSearchBarFocused = false; // Reset focus when going home
            });
            FocusScope.of(context).unfocus(); // Actively unfocus
          },
        ),
        IconButton(
          icon: const Icon(Iconsax.add_square),
          onPressed: () => _createNewTab(),
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
            currentTab.controller.reload();
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
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemThree,
          child: const Row(
            children: [
              Icon(Iconsax.share),
              SizedBox(width: 10),
              Text('Share'),
            ],
          ),
          onTap: () {
            sharePressed();
            }
        ),
      ],
    );
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    resizeToAvoidBottomInset: false,
    body: GestureDetector( 
      onTap: () {
        // Unfocus the searchbar and update state
        FocusScope.of(context).unfocus();
        setState(() {
          isSearchBarFocused = false;
        });
      },
      child: Padding(
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
                bottom: MediaQuery.of(context).viewInsets.bottom -105,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    _buildSearchBar(floating: true),
                  ],
                ),
              ),
          ],
        ),
      ),
    ),
    bottomNavigationBar: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTabBar(),
        if (!isSearchBarFocused) _buildSearchBar(),
        _buildNavigationControls(),
      ],
    ),
  );
 }
}