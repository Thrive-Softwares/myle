import 'package:flutter/material.dart';
import 'package:myle/standard/components/search_engine_provider.dart';
import 'package:provider/provider.dart';
import 'package:iconsax/iconsax.dart';

class SearchEngineOptionPage extends StatelessWidget {
  const SearchEngineOptionPage({super.key});

  Widget _buildSearchEngineOption(
    BuildContext context, 
    String name, 
    SearchEngine engine,
    SearchEngine currentEngine,
    Function(SearchEngine) onSelect,
  ) {
    return GestureDetector(
      onTap: () => onSelect(engine),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.only(left: 25, right: 25),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name),
            if (currentEngine == engine)
              const Icon(Iconsax.tick_circle),
          ],
        ),
      ),
    );
  }

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
              _buildSearchEngineOption(
                context, 
                'Qwant', 
                SearchEngine.qwant,
                provider.currentEngine,
                provider.setSearchEngine,
              ),
              const SizedBox(height: 10),
              _buildSearchEngineOption(
                context, 
                'Google', 
                SearchEngine.google,
                provider.currentEngine,
                provider.setSearchEngine,
              ),
              const SizedBox(height: 10),
              _buildSearchEngineOption(
                context, 
                'DuckDuckGo', 
                SearchEngine.duckduckgo,
                provider.currentEngine,
                provider.setSearchEngine,
              ),
              const SizedBox(height: 10),
              _buildSearchEngineOption(
                context, 
                'Ecosia', 
                SearchEngine.ecosia,
                provider.currentEngine,
                provider.setSearchEngine,
              ),
              const SizedBox(height: 10),
              _buildSearchEngineOption(
                context, 
                'Brave', 
                SearchEngine.brave,
                provider.currentEngine,
                provider.setSearchEngine,
              ),
              const SizedBox(height: 10),
              _buildSearchEngineOption(
                context, 
                'Yahoo!', 
                SearchEngine.yahoo,
                provider.currentEngine,
                provider.setSearchEngine,
              ),
              const SizedBox(height: 10),
              _buildSearchEngineOption(
                context, 
                'Bing', 
                SearchEngine.bing,
                provider.currentEngine,
                provider.setSearchEngine,
              ),
            ],
          ),
        );
      },
    );
  }
}