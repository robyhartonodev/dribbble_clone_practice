import 'package:dribbble_clone_practice/coffee_app/models/food_item.dart';
import 'package:flutter/material.dart';

class CoffeeAppStateProvider extends ChangeNotifier {
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