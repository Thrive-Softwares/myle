import 'package:flutter/material.dart';
import 'package:myle/standard/components/corner_provider.dart';
import 'package:provider/provider.dart';
import 'package:toasty_box/toast_enums.dart';
import 'package:toasty_box/toast_service.dart';

class CornerRadiusPage extends StatefulWidget {
  const CornerRadiusPage({super.key});

  @override
  State<CornerRadiusPage> createState() => _CornerRadiusPageState();
}

class _CornerRadiusPageState extends State<CornerRadiusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Corner Radius')),
      body: Center(
        child: Column(
          children: [

            SizedBox(height: 20,),
        
            GestureDetector(
              onTap: () {
                Provider.of<CornerProvider>(context, listen: false).setCornerRadius(CornerRadius.rectangle);
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
                  border: Border.all(color: Theme.of(context).colorScheme.tertiary),
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    margin: const EdgeInsets.only(left: 25, right: 25),
                    padding: const EdgeInsets.only(top: 16, bottom: 16, left: 100, right: 100),
                child: Text(
                      "Rectangle",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      ),
              ),
            ),
        
            SizedBox(height: 20,),
        
            GestureDetector(
              onTap: () {
                Provider.of<CornerProvider>(context, listen: false).setCornerRadius(CornerRadius.rounded);
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
                  border: Border.all(color: Theme.of(context).colorScheme.tertiary),
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: const EdgeInsets.only(left: 25, right: 25),
                    padding: const EdgeInsets.only(top: 16, bottom: 16, left: 100, right: 100),
                child: Text(
                      "Rounded",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      ),
              ),
            ),
        
            SizedBox(height: 20,),
        
            GestureDetector(
              onTap: () {
                Provider.of<CornerProvider>(context, listen: false).setCornerRadius(CornerRadius.round);
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
                  border: Border.all(color: Theme.of(context).colorScheme.tertiary),
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(99),
                    ),
                    margin: const EdgeInsets.only(left: 25, right: 25),
                    padding: const EdgeInsets.only(top: 16, bottom: 16, left: 100, right: 100),
                child: Text(
                      "Round",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}