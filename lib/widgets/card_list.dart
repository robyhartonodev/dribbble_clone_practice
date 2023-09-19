import 'package:dribbble_clone_practice/main.dart';
import 'package:dribbble_clone_practice/models/food_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardListWidget extends StatelessWidget {
  final List<FoodItem> foodItems;

  const CardListWidget({super.key, required this.foodItems});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 475,
      child: ListView(
        padding: const EdgeInsets.all(2.0),
        scrollDirection: Axis.horizontal,
        children: [
          for (FoodItem foodItem in foodItems)
            CoffeeCardWidget(
              foodItem: foodItem,
            )
        ],
      ),
    );
  }
}

class CoffeeCardWidget extends StatelessWidget {
  final FoodItem foodItem;

  const CoffeeCardWidget({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () {
        appState.setPageIndex(5);
        appState.setFoodItem(foodItem);
      },
      child: SizedBox(
        width: 272.0,
        height: 300.0,
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.fromLTRB(0.0, 32.0, 32.0, 0.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32.0),
                      child: Image(
                        width: double.infinity,
                        image: AssetImage(foodItem.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      foodItem.name,
                      style: const TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(36.0),
                                  child: const Image(
                                    width: 36.0,
                                    height: 36.0,
                                    image: AssetImage(
                                        '/images/random_person_1.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(36.0),
                                  child: const Image(
                                    width: 36.0,
                                    height: 36.0,
                                    image: AssetImage(
                                        '/images/random_person_1.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(36.0),
                                  child: const Image(
                                    width: 36.0,
                                    height: 36.0,
                                    image: AssetImage(
                                        '/images/random_person_1.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                foodItem.ratings.toStringAsPrecision(2),
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 102.0,
                right: 12.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
