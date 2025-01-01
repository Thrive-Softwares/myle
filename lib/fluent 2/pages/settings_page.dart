import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myle/fluent%202/pages/style_page.dart';
import 'package:myle/standard/components/corner_provider.dart';
import 'package:myle/fluent 2/pages/corner_radius_page.dart';
import 'package:myle/fluent 2/pages/search_engine_option_page.dart';
import 'package:provider/provider.dart';
import 'package:toasty_box/toast_enums.dart';
import 'package:toasty_box/toast_service.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _urlRepo = Uri.parse('https://github.com/Thrive-Softwares/myle');
final Uri _urlKofi = Uri.parse('https://ko-fi.com/thriveengineer');

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static const platform = MethodChannel('com.yourdomain.browser/default_browser');

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

Future<void> _setDefaultBrowser() async {
    try {
      final bool result = await platform.invokeMethod('setDefaultBrowser');
      if (result) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Successfully set as default browser')),
        );
      }
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to set as default browser: ${e.message}')),
      );
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
                  		child: Text('Color Modes are with this Style not available', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                  	),
                  ),
                );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.tertiary),
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
                  Icon(FluentSystemIcons.ic_fluent_arrow_right_regular, size: 20,),
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
                border: Border.all(color: Theme.of(context).colorScheme.tertiary),
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
                  Icon(FluentSystemIcons.ic_fluent_arrow_right_regular, size: 20,),
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
                border: Border.all(color: Theme.of(context).colorScheme.tertiary),
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
                  Icon(FluentSystemIcons.ic_fluent_arrow_right_regular, size: 20,),
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
                border: Border.all(color: Theme.of(context).colorScheme.tertiary),
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
                  Icon(FluentSystemIcons.ic_fluent_arrow_right_regular, size: 20,),
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
                border: Border.all(color: Theme.of(context).colorScheme.tertiary),
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
                  Icon(FluentSystemIcons.ic_fluent_arrow_right_regular, size: 20,),
                ],
              ),
            ),
          ),

          SizedBox(height: 10,),

          GestureDetector(
            onTap: () {
              _setDefaultBrowser();
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.tertiary),
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
                  Icon(FluentSystemIcons.ic_fluent_arrow_right_regular, size: 20,),
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