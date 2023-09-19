import 'package:dribbble_clone_practice/main.dart';
import 'package:dribbble_clone_practice/models/food_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final FoodItem foodItem;

  const DetailPage({super.key, required this.foodItem});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

    List<Widget> starWidgets = [];
    starWidgets.add(
      Text(
        appState.selectedFoodItem.ratings.toStringAsPrecision(2),
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    for (int i = 1; i <= 5; i++) {
      if (appState.selectedFoodItem.ratings.toInt() >= i) {
        starWidgets.add(
          const Icon(
            Icons.star,
            color: Colors.yellow,
          ),
        );
      } else {
        starWidgets.add(
          const Icon(
            Icons.star,
            color: Colors.grey,
          ),
        );
      }
    }

    return ListView(
      children: [
        Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 450,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        spreadRadius: 1,
                        blurRadius: 10,
                      ),
                    ],
                    color: Colors.transparent,
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(32.0),
                          bottomRight: Radius.circular(32.0),
                        ),
                        child: Image(
                          width: double.infinity,
                          height: 430,
                          image: AssetImage(appState.selectedFoodItem.image),
                          fit: BoxFit.cover,
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 48,
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            appState.setPageIndex(0);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.grey,
                            size: 24,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.file_upload_outlined,
                            color: Colors.grey,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8.0,
                  right: 16.0,
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
            Container(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appState.selectedFoodItem.name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "\$${appState.selectedFoodItem.price}",
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.grey,
                          ),
                          Text(
                            "20 min",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Divider(
                  thickness: 1.0,
                  color: Colors.grey,
                ),
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(
                      child: Text(
                        'Details',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Ingredients',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Review',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  dividerColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelColor: Colors.grey,
                ),
                Container(
                  padding: const EdgeInsets.all(32.0),
                  height: 500,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // Content of Tab 1
                      Column(
                        children: [
                          Text(
                            appState.selectedFoodItem.description,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 4.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(36.0),
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
                                      padding:
                                          const EdgeInsets.only(right: 4.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(36.0),
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
                                      padding:
                                          const EdgeInsets.only(right: 4.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(36.0),
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
                                      padding:
                                      const EdgeInsets.only(right: 4.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(32.0),
                                          color: Colors.grey.shade300,
                                        ),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.add),
                                          color: Colors.brown,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(children: starWidgets)
                              ],
                            ),
                          )
                        ],
                      ),
                      // Content of Tab 2
                      const Text('Ingredients'),
                      // Content of Tab 3
                      const Text('Review'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
