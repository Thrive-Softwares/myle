import 'package:flutter/material.dart';
import 'package:myle/nothing/pages/style_page.dart';
import 'package:myle/standard/components/corner_provider.dart';
import 'package:myle/nothing/pages/color_mode_page.dart';
import 'package:myle/nothing/pages/corner_radius_page.dart';
import 'package:myle/nothing/pages/search_engine_option_page.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _urlRepo = Uri.parse('https://github.com/Thrive-Softwares/myle');
final Uri _urlKofi = Uri.parse('https://ko-fi.com/thriveengineer');

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  Future<void> _launchUrlRepo() async {
  if (!await launchUrl(_urlRepo)) {
    throw Exception('Could not launch $_urlRepo');
  }
}

Future<void> _launchUrlKofi() async {
  if (!await launchUrl(_urlKofi)) {
    throw Exception('Could not launch $_urlKofi');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [

          SizedBox(height: 20,),

          Text("Appearance"),
          Divider(endIndent: 45, indent: 45,),

          SizedBox(height: 10,),

          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ColorModePage()));
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
                    "Color Mode",
                    ),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
          ),

          SizedBox(height: 10,),
          
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StylePage()));
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
                    "Styles",
                    ),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
          ),

          /*
          SizedBox(height: 10,),

          GestureDetector(
            onTap: () {
              
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
                    "Navbar",
                    ),
                  Icon(Iconsax.arrow_right_3),
                ],
              ),
            ),
          ),
          */

          SizedBox(height: 10,),

          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CornerRadiusPage()));
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
                    "Corner Radius",
                    ),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
          ),

          SizedBox(height: 20,),

          Text("Defaults"),
          Divider(endIndent: 45, indent: 45,),

          SizedBox(height: 10,),

          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchEngineOptionPage()));
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
                    "Search Engine",
                    ),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
          ),

          SizedBox(height: 10,),

          GestureDetector(
            onTap: () {
              
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
                    "Language | Coming Soon!",
                    ),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
          ),

          SizedBox(height: 10,),

          GestureDetector(
            onTap: () {
              
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
                    "Set as Default Browser",
                    ),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
          ),

          SizedBox(height: 20,),

          Divider(
            height: 20,
            indent: 45,
            endIndent: 45,
          ),
          TextButton(
            onPressed: () {
                _launchUrlRepo();
              },
            child: Text(
              "Git Repository", 
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,),
              ),
            ),

            GestureDetector(
              onTap: () {
                _launchUrlKofi();
              },
                child: Text(
                  'Support me',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
            ),
        ],
      ),
    );
  }
}