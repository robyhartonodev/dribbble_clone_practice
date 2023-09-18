import 'dart:ui';

import 'package:dribbble_clone_practice/models/food_item.dart';
import 'package:dribbble_clone_practice/pages/detail_page.dart';
import 'package:dribbble_clone_practice/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
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
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: <Widget>[
          DetailPage(
            foodItem: FoodItem(
              ratings: 4.0,
              name: 'Hot Coffee',
              type: 'Coffee',
              icon: null,
              description: 'Testing',
              price: 15.0,
              image: 'images/coffee.png',
            ),
          ),
          DetailPage(
            foodItem: FoodItem(
              ratings: 4.0,
              name: 'Hot Coffee',
              type: 'Coffee',
              icon: null,
              description: 'Testing',
              price: 15.0,
              image: 'images/coffee.png',
            ),
          ),
          HomePage(),
          HomePage(),
          HomePage(),
        ][currentPageIndex],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(icon: Icon(Icons.home_filled), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.coffee), label: 'Order'),
            NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
            NavigationDestination(
                icon: Icon(Icons.workspace_premium), label: 'Reward'),
            NavigationDestination(icon: Icon(Icons.list), label: 'Menu')
          ],
          surfaceTintColor: Colors.white,
        ),
      ),
    );
  }
}
