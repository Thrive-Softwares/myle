import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myle/material%203/pages/settings_page.dart';
import 'package:myle/material%203/pages/start_page.dart';
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
  final urlController = TextEditingController();
  bool isLoading = false;
  bool showHomePage = true;
  bool showMenu = false;
  final FocusNode _focusNode = FocusNode();
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) => setState(() {
          isLoading = true;
          showHomePage = false;
        }),
        onPageFinished: (url) => setState(() => isLoading = false),
      ));

    _focusNode.addListener(() {
      setState(() {
        isKeyboardVisible = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    urlController.dispose();
    super.dispose();
  }

  bool isValidUrl(String url) {
    final commonTlds = [
      '.com', '.net', '.org', '.gov', '.edu', 
      '.us', '.de', '.uk', '.app', '.ai', 
      '.co', '.io', '.tech', '.xyz', '.dev',
      '.cv', '.design', '.cloud', '.ca'
    ];
    
    return url.startsWith('http') || 
           url.startsWith('www.') ||
           commonTlds.any((tld) => url.endsWith(tld));
  }

  void loadUrl(String url) {
    if (url.isNotEmpty) {
      if (isValidUrl(url)) {
        final uri = Uri.parse(url.startsWith('http') ? url : 'https://$url');
        controller.loadRequest(uri);
      } else {
        final uri = Uri.parse('https://www.qwant.com/?l=en&q=$url&t=web');
        controller.loadRequest(uri);
      }
    }
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,  // Prevent resizing when keyboard appears
      body: Stack(
        children: [
          if (showHomePage)
            HomePage(onUrlSelected: loadUrl)
          else
            WebViewWidget(controller: controller),
          if (isLoading)
            const LinearProgressIndicator(),
          // Floating search bar when keyboard is visible
          if (isKeyboardVisible)
            Positioned(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 0,
              right: 0,
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: TextField(
              focusNode: _focusNode,
              controller: urlController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
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
            ),
        ],
      ),
      bottomNavigationBar: !isKeyboardVisible ? Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showMenu)
            Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(Icons.bookmark),
                    title: const Text('Bookmarks'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.history),
                    title: const Text('History'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          // Search Bar (when keyboard is not visible)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: TextField(
              focusNode: _focusNode,
              controller: urlController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
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
          // Navigation Controls
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Iconsax.arrow_left_2),
                  onPressed: () => controller.goBack(),
                ),
                IconButton(
                  icon: const Icon(Iconsax.arrow_right_3),
                  onPressed: () => controller.goForward(),
                ),
                IconButton(
                  icon: const Icon(Iconsax.home_2),
                  onPressed: () => setState(() => showHomePage = true),
                ),
                IconButton(
                  icon: const Icon(Iconsax.add_square),
                  onPressed: () => controller.goBack(),
                ),
                IconButton(
                  icon: const Icon(Iconsax.square),
                  onPressed: () => controller.goBack(),
                ),
                PopupMenuButton<SampleItem>(
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
                ),
              ],
            ),
          ),
        ],
      ) : null,
    );
  }
}