import 'package:dribbble_clone_practice/models/food_item.dart';
import 'package:dribbble_clone_practice/models/food_type.dart';
import 'package:dribbble_clone_practice/widgets/card_list.dart';
import 'package:dribbble_clone_practice/widgets/food_type_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      ratings: 4.3,
      name: 'Cappucino',
      type: 'Coffee',
      icon: null,
      description: 'Testing',
      price: 18.0,
      image: 'images/cappucino.png',
    ),
    FoodItem(
      ratings: 4.0,
      name: 'Espresso',
      type: 'Coffee',
      icon: null,
      description: 'Testing',
      price: 15.0,
      image: 'images/espresso.png',
    )
  ];

  List<FoodType> foodTypes = [
    FoodType(
        name: 'Drink',
        icon: const Icon(
          Icons.local_drink_outlined,
          size: 28.0,
          color: Colors.brown,
        ),
        count: 12),
    FoodType(
        name: 'Coffee',
        icon: const Icon(
          Icons.coffee,
          size: 28.0,
          color: Colors.brown,
        ),
        count: 22),
    FoodType(
        name: 'Desert',
        icon: const Icon(
          Icons.cake_outlined,
          size: 28.0,
          color: Colors.brown,
        ),
        count: 12),
    FoodType(
        name: 'Drink',
        icon: const Icon(
          Icons.local_drink_outlined,
          size: 28.0,
          color: Colors.brown,
        ),
        count: 12),
    FoodType(
        name: 'Coffee',
        icon: const Icon(
          Icons.coffee,
          size: 28.0,
          color: Colors.brown,
        ),
        count: 22),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Good morning',
                  style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
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
    );
  }
}
