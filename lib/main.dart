import 'dart:ui';

import 'package:dribbble_clone_practice/models/food_item.dart';
import 'package:dribbble_clone_practice/pages/detail_page.dart';
import 'package:dribbble_clone_practice/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MyApp(),
    ),
  );
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class AppState extends ChangeNotifier {
  int pageIndex = 0;
  late FoodItem selectedFoodItem = FoodItem(
    ratings: 4.0,
    name: 'Hot Coffee',
    type: 'Coffee',
    icon: null,
    description: 'Testing',
    price: 15.0,
    image: 'images/coffee.png',
  );

  int get getPageIndex {
    return pageIndex;
  }

  void setPageIndex(int newPageIndex) {
    pageIndex = newPageIndex;
    notifyListeners();
  }

  FoodItem get getFoodItem {
    return selectedFoodItem;
  }

  void setFoodItem(FoodItem foodItem) {
    selectedFoodItem = foodItem;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      scrollBehavior: CustomScrollBehavior(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown.shade500),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

    return Scaffold(
      body: <Widget>[
        HomePage(),
        HomePage(),
        HomePage(),
        HomePage(),
        DetailPage(foodItem: appState.selectedFoodItem)
      ][appState.pageIndex],
      bottomNavigationBar: Container(
        height: (appState.pageIndex < 5) ? 80 : 120,
        child: Column(
          children: [
            (appState.pageIndex < 5)
                ? NavigationBar(
                    onDestinationSelected: (int index) {
                      setState(() {
                        appState.pageIndex = index;
                      });
                    },
                    selectedIndex: appState.pageIndex,
                    destinations: const <Widget>[
                      NavigationDestination(
                          icon: Icon(Icons.home_filled), label: 'Home'),
                      NavigationDestination(
                          icon: Icon(Icons.coffee), label: 'Order'),
                      NavigationDestination(
                          icon: Icon(Icons.search), label: 'Search'),
                      NavigationDestination(
                          icon: Icon(Icons.workspace_premium), label: 'Reward'),
                      NavigationDestination(
                          icon: Icon(Icons.list), label: 'Menu')
                    ],
                    surfaceTintColor: Colors.white,
                  )
                : Container(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                              side: const BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            child: const Text(
                              'Add to cart',
                              style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                            ),
                            child: const Text(
                              'Order now',
                              style: TextStyle(fontSize: 24.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
