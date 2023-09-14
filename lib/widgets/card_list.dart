import 'package:dribbble_clone_practice/models/food_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardListWidget extends StatelessWidget {
  const CardListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [],
    );
  }
}

class CoffeeCardWidget extends StatelessWidget {
  final FoodItem foodItem;

  const CoffeeCardWidget({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(32.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}
