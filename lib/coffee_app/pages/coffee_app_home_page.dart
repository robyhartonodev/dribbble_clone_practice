import 'package:dribbble_clone_practice/coffee_app/providers/coffee_app_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detail_page.dart';
import 'home_page.dart';

class CoffeeAppHomePage extends StatefulWidget {
  const CoffeeAppHomePage({super.key});

  @override
  State<CoffeeAppHomePage> createState() => _CoffeeAppHomePageState();
}

class _CoffeeAppHomePageState extends State<CoffeeAppHomePage> {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<CoffeeAppStateProvider>(context);

    return Scaffold(
      body: <Widget>[
        HomePage(),
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