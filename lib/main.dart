import 'dart:ui';

import 'package:dribbble_clone_practice/models/food_type.dart';
import 'package:dribbble_clone_practice/widgets/card_list.dart';
import 'package:dribbble_clone_practice/widgets/food_type_list.dart';
import 'package:flutter/material.dart';

import 'models/food_item.dart';

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
      home: const MyHomePage(),
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

  List<FoodItem> foodItems = [
    FoodItem(
      ratings: 4.0,
      name: 'Hot Coffee',
      type: 'Coffee',
      icon: null,
      description: 'Testing',
      price: 15.0,
      image: 'images/coffee.png',
    ),
    FoodItem(
      ratings: 4.0,
      name: 'Hot Coffee',
      type: 'Coffee',
      icon: null,
      description: 'Testing',
      price: 15.0,
      image: 'images/coffee.png',
    ),
    FoodItem(
      ratings: 4.0,
      name: 'Hot Coffee',
      type: 'Coffee',
      icon: null,
      description: 'Testing',
      price: 15.0,
      image: 'images/coffee.png',
    )
  ];

  List<FoodType> foodTypes = [
    FoodType(
        name: 'Drink',
        icon: Icon(
          Icons.local_drink_outlined,
          size: 28.0,
          color: Colors.brown,
        ),
        count: 12),
    FoodType(
        name: 'Coffee',
        icon: Icon(
          Icons.coffee,
          size: 28.0,
          color: Colors.brown,
        ),
        count: 22),
    FoodType(
        name: 'Desert',
        icon: Icon(
          Icons.cake_outlined,
          size: 28.0,
          color: Colors.brown,
        ),
        count: 12),
    FoodType(
        name: 'Drink',
        icon: Icon(
          Icons.local_drink_outlined,
          size: 28.0,
          color: Colors.brown,
        ),
        count: 12),
    FoodType(
        name: 'Coffee',
        icon: Icon(
          Icons.coffee,
          size: 28.0,
          color: Colors.brown,
        ),
        count: 22),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Good morning',
                    style:
                        TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      print('pressed');
                    },
                    icon: const Icon(Icons.shopping_cart,
                        color: Colors.grey, size: 36.0),
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Jerry',
                    style:
                        TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8.0),
                  Icon(Icons.coffee, size: 36.0)
                ],
              ),
              FoodTypeListWidget(foodTypes: foodTypes),
              CardListWidget(foodItems: foodItems),
            ],
          ),
        ),
      ),
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
    );
  }
}
