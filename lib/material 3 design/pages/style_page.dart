import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myle/design_system_router.dart';
import 'package:myle/standard/components/corner_provider.dart';
import 'package:provider/provider.dart';
import 'package:toasty_box/toast_enums.dart';
import 'package:toasty_box/toast_service.dart';

class StylePage extends StatefulWidget {
  const StylePage({super.key});

  @override
  State<StylePage> createState() => _StylePageState();
}

class _StylePageState extends State<StylePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Color Mode')),
      body: Column(
        children: [

          SizedBox(height: 20,),

          GestureDetector(
            onTap: () {
              Provider.of<StyleProvider>(context, listen: false).setStyle(Style.material);
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
                  		child: Text('Please restart the app', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
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
                    "Material Design",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                    ),
                    ),
                  Icon(Icons.design_services_rounded, color: Theme.of(context).colorScheme.inversePrimary,),
                ],
              ),
            ),
          ),

          SizedBox(height: 10,),

          GestureDetector(
            onTap: () {
              Provider.of<StyleProvider>(context, listen: false).setStyle(Style.standard);
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
                  		child: Text('Please restart the app', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
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
                    "Standard",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                    ),
                    ),
                  Icon(Icons.design_services_rounded, color: Theme.of(context).colorScheme.inversePrimary,),
                ],
              ),
            ),
          ),

          SizedBox(height: 10,),

          GestureDetector(
            onTap: () {
              Provider.of<StyleProvider>(context, listen: false).setStyle(Style.fluent);
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
                  		child: Text('Please restart the app', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
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
                    "Fluent 2",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                    ),
                    ),
                  Icon(Icons.design_services_rounded, color: Theme.of(context).colorScheme.inversePrimary,),
                ],
              ),
            ),
          ),

          SizedBox(height: 10,),

          GestureDetector(
            onTap: () {
              Provider.of<StyleProvider>(context, listen: false).setStyle(Style.nothing);
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
                  		child: Text('Please restart the app', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
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
                    "Nothing",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                    ),
                    ),
                  Icon(Icons.design_services_rounded, color: Theme.of(context).colorScheme.inversePrimary,),
                ],
              ),
            ),
          ),

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
                  		child: Text('Coming Soon!', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
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
                    "Cupertino | Coming Soon!",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                    ),
                    ),
                  Icon(Icons.design_services_rounded, color: Theme.of(context).colorScheme.inversePrimary,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}