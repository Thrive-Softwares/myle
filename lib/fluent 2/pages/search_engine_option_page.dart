import 'package:flutter/material.dart';
import 'package:myle/standard/components/corner_provider.dart';
import 'package:myle/standard/components/search_engine_provider.dart';
import 'package:provider/provider.dart';
import 'package:toasty_box/toast_enums.dart';
import 'package:toasty_box/toast_service.dart';

class SearchEngineOptionPage extends StatefulWidget {
  const SearchEngineOptionPage({super.key});

  @override
  State<SearchEngineOptionPage> createState() => _SearchEngineOptionPageState();
}

class _SearchEngineOptionPageState extends State<SearchEngineOptionPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchEngineProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Search Engine'),
          ),
          body: Column(
            children: [

              const SizedBox(height: 20),

              GestureDetector(
            onTap: () {
              Provider.of<SearchEngineProvider>(context, listen: false).setSearchEngine(SearchEngine.qwant);
              ToastService.showWidgetToast(
                  context,
                  isClosable: true,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shadowColor: const Color.fromARGB(255, 117, 117, 117),
                  length: ToastLength.medium,
                  expandedHeight: 100,
                  slideCurve: Curves.elasticInOut,
                  positionCurve: Curves.bounceOut,
                  dismissDirection: DismissDirection.none,
                  child: Container(
                  	color: Theme.of(context).colorScheme.secondary,
                  	child: Center(
                  		child: Text('You are now searching with Qwant', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                  	),
                  ),
                );
            },
            child: Container(
              decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(Provider.of<CornerProvider>(context, listen: false).getCornerRadius(),),
                  ),
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Qwant",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                    ),
                    ),
                    Image.asset("lib/assets/qwant.png", height: 32,),
                ],
              ),
            ),
          ),

              const SizedBox(height: 10),

              GestureDetector(
            onTap: () {
              Provider.of<SearchEngineProvider>(context, listen: false).setSearchEngine(SearchEngine.google);
              ToastService.showWidgetToast(
                  context,
                  isClosable: true,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shadowColor: const Color.fromARGB(255, 117, 117, 117),
                  length: ToastLength.medium,
                  expandedHeight: 100,
                  slideCurve: Curves.elasticInOut,
                  positionCurve: Curves.bounceOut,
                  dismissDirection: DismissDirection.none,
                  child: Container(
                  	color: Theme.of(context).colorScheme.secondary,
                  	child: Center(
                  		child: Text('You are now searching with Google', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                  	),
                  ),
                );
            },
            child: Container(
              decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(Provider.of<CornerProvider>(context, listen: false).getCornerRadius(),),
                  ),
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Google",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                    ),
                    ),
                    Image.asset("lib/assets/google.png", height: 32,),
                ],
              ),
            ),
          ),

              const SizedBox(height: 10),

              GestureDetector(
            onTap: () {
              Provider.of<SearchEngineProvider>(context, listen: false).setSearchEngine(SearchEngine.duckduckgo);
              ToastService.showWidgetToast(
                  context,
                  isClosable: true,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shadowColor: const Color.fromARGB(255, 117, 117, 117),
                  length: ToastLength.medium,
                  expandedHeight: 100,
                  slideCurve: Curves.elasticInOut,
                  positionCurve: Curves.bounceOut,
                  dismissDirection: DismissDirection.none,
                  child: Container(
                  	color: Theme.of(context).colorScheme.secondary,
                  	child: Center(
                  		child: Text('You are now searching with DuckDuckGo', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                  	),
                  ),
                );
            },
            child: Container(
              decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(Provider.of<CornerProvider>(context, listen: false).getCornerRadius(),),
                  ),
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "DuckDuckGo",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                    ),
                    ),
                    Image.asset("lib/assets/duckduckgo.png", height: 32,),
                ],
              ),
            ),
          ),

              const SizedBox(height: 10),

              GestureDetector(
            onTap: () {
              Provider.of<SearchEngineProvider>(context, listen: false).setSearchEngine(SearchEngine.ecosia);
              ToastService.showWidgetToast(
                  context,
                  isClosable: true,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shadowColor: const Color.fromARGB(255, 117, 117, 117),
                  length: ToastLength.medium,
                  expandedHeight: 100,
                  slideCurve: Curves.elasticInOut,
                  positionCurve: Curves.bounceOut,
                  dismissDirection: DismissDirection.none,
                  child: Container(
                  	color: Theme.of(context).colorScheme.secondary,
                  	child: Center(
                  		child: Text('You are now searching with Ecosia', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                  	),
                  ),
                );
            },
            child: Container(
              decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(Provider.of<CornerProvider>(context, listen: false).getCornerRadius(),),
                  ),
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ecosia",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                    ),
                    ),
                    Image.asset("lib/assets/ecosia.png", height: 32,),
                ],
              ),
            ),
          ),

              const SizedBox(height: 10),

              GestureDetector(
            onTap: () {
              Provider.of<SearchEngineProvider>(context, listen: false).setSearchEngine(SearchEngine.brave);
              ToastService.showWidgetToast(
                  context,
                  isClosable: true,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shadowColor: const Color.fromARGB(255, 117, 117, 117),
                  length: ToastLength.medium,
                  expandedHeight: 100,
                  slideCurve: Curves.elasticInOut,
                  positionCurve: Curves.bounceOut,
                  dismissDirection: DismissDirection.none,
                  child: Container(
                  	color: Theme.of(context).colorScheme.secondary,
                  	child: Center(
                  		child: Text('You are now searching with Brave', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                  	),
                  ),
                );
            },
            child: Container(
              decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(Provider.of<CornerProvider>(context, listen: false).getCornerRadius(),),
                  ),
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Brave",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                    ),
                    ),
                    Image.asset("lib/assets/brave.png", height: 32,),
                ],
              ),
            ),
          ),

              const SizedBox(height: 10),

              GestureDetector(
            onTap: () {
              Provider.of<SearchEngineProvider>(context, listen: false).setSearchEngine(SearchEngine.yahoo);
              ToastService.showWidgetToast(
                  context,
                  isClosable: true,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shadowColor: const Color.fromARGB(255, 117, 117, 117),
                  length: ToastLength.medium,
                  expandedHeight: 100,
                  slideCurve: Curves.elasticInOut,
                  positionCurve: Curves.bounceOut,
                  dismissDirection: DismissDirection.none,
                  child: Container(
                  	color: Theme.of(context).colorScheme.secondary,
                  	child: Center(
                  		child: Text('You are now searching with Yahoo', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                  	),
                  ),
                );
            },
            child: Container(
              decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(Provider.of<CornerProvider>(context, listen: false).getCornerRadius(),),
                  ),
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Yahoo!",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                    ),
                    ),
                    Image.asset("lib/assets/yahoo.png", height: 32,),
                ],
              ),
            ),
          ),

              const SizedBox(height: 10),

              GestureDetector(
            onTap: () {
              Provider.of<SearchEngineProvider>(context, listen: false).setSearchEngine(SearchEngine.bing);
              ToastService.showWidgetToast(
                  context,
                  isClosable: true,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shadowColor: const Color.fromARGB(255, 117, 117, 117),
                  length: ToastLength.medium,
                  expandedHeight: 100,
                  slideCurve: Curves.elasticInOut,
                  positionCurve: Curves.bounceOut,
                  dismissDirection: DismissDirection.none,
                  child: Container(
                  	color: Theme.of(context).colorScheme.secondary,
                  	child: Center(
                  		child: Text('You are now searching with Bing', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                  	),
                  ),
                );
            },
            child: Container(
              decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(Provider.of<CornerProvider>(context, listen: false).getCornerRadius(),),
                  ),
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bing",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                    ),
                   ),
                   Image.asset("lib/assets/bing.png", height: 32,),
                ],
              ),
            ),
          ),
            ],
          ),
        );
      },
    );
  }
}