import 'package:dribbble_clone_practice/models/food_type.dart';
import 'package:flutter/material.dart';

class FoodTypeListWidget extends StatelessWidget {
  final List<FoodType> foodTypes;

  const FoodTypeListWidget({super.key, required this.foodTypes});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: ListView(
        padding: const EdgeInsets.all(2.0),
        scrollDirection: Axis.horizontal,
        children: [
          for (FoodType foodType in foodTypes)
            FoodTypeCardWidget(
              foodType: foodType,
            )
        ],
      ),
    );
  }
}

class FoodTypeCardWidget extends StatelessWidget {
  final FoodType foodType;

  const FoodTypeCardWidget({super.key, required this.foodType});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 144.0,
      height: 150.0,
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.fromLTRB(0.0, 32.0, 32.0, 0.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(64.0)),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: 64,
                height: 64,
                margin: const EdgeInsets.only(bottom: 8.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2.0,
                    )),
                child: foodType.icon,
              ),
              Text(
                foodType.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 64,
                height: 24,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 8.0),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2.0,
                    )),
                child: Text(foodType.count.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
