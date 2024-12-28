import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myle/standard/components/corner_provider.dart';
import 'package:myle/standard/components/theme_provider.dart';
import 'package:provider/provider.dart';

class ColorModePage extends StatefulWidget {
  const ColorModePage({super.key});

  @override
  State<ColorModePage> createState() => _ColorModePageState();
}

class _ColorModePageState extends State<ColorModePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Color Mode')),
      body: Column(
        children: [

          GestureDetector(
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false).setTheme(ThemeType.dark);
            },
            child: Container(
              decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(Provider.of<CornerProvider>(context, listen: false).getCornerRadius(),),
                  ),
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Black (Dark)",
                    style: TextStyle(
                      color: Colors.white
                    ),
                    ),
                  Icon(Iconsax.color_swatch, color: Colors.white,),
                ],
              ),
            ),
          ),

          SizedBox(height: 10,),

          GestureDetector(
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false).setTheme(ThemeType.light);
            },
            child: Container(
              decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Provider.of<CornerProvider>(context, listen: false).getCornerRadius(),),
                  ),
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "White (Light)",
                    style: TextStyle(
                      color: Colors.black
                    ),
                    ),
                  Icon(Iconsax.color_swatch, color: Colors.black,),
                ],
              ),
            ),
          ),

          SizedBox(height: 10,),

          GestureDetector(
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false).setTheme(ThemeType.blue);
            },
            child: Container(
              decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(Provider.of<CornerProvider>(context, listen: false).getCornerRadius(),),
                  ),
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Blue",
                    style: TextStyle(
                      color: Colors.white
                    ),
                    ),
                  Icon(Iconsax.color_swatch, color: Colors.white,),
                ],
              ),
            ),
          ),

          SizedBox(height: 10,),

          GestureDetector(
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false).setTheme(ThemeType.forest);
            },
            child: Container(
              decoration: BoxDecoration(
                    color: Color.fromARGB(255, 174, 104, 26),
                    borderRadius: BorderRadius.circular(Provider.of<CornerProvider>(context, listen: false).getCornerRadius(),),
                  ),
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Forest",
                    style: TextStyle(
                      color: Colors.white
                    ),
                    ),
                  Icon(Iconsax.color_swatch, color: Colors.white,),
                ],
              ),
            ),
          ),

          SizedBox(height: 10,),

          GestureDetector(
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false).setTheme(ThemeType.cozy);
            },
            child: Container(
              decoration: BoxDecoration(
                    color: Color.fromARGB(255, 155, 124, 185),
                    borderRadius: BorderRadius.circular(Provider.of<CornerProvider>(context, listen: false).getCornerRadius(),),
                  ),
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Violet",
                    style: TextStyle(
                      color: Colors.white
                    ),
                    ),
                  Icon(Iconsax.color_swatch, color: Colors.white,),
                ],
              ),
            ),
          ),

          SizedBox(height: 20,),

          Text(
            "More Colors to come...",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),
            ),

        ],
      ),
    );
  }
}