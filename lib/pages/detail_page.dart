import 'package:dribbble_clone_practice/main.dart';
import 'package:dribbble_clone_practice/models/food_item.dart';
import 'package:flutter/material.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                  )
                ]),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(32.0),
                    bottomRight: Radius.circular(32.0),
                  ),
                  child: Image(
                    width: double.infinity,
                    height: 430,
                    image: AssetImage(widget.foodItem.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 48,
                child: Container(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()));
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
            ],
          ),
          Container(
            padding: EdgeInsets.all(32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hot Coffee",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "\$15",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
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
              Container(
                padding: EdgeInsets.all(8.0),
                child: TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(text: 'Tab 1'),
                    Tab(text: 'Tab 2'),
                    Tab(text: 'Tab 3'),
                  ],
                ),
              ),
              // TabBarView(
              //   controller: _tabController,
              //   children: [
              //     // Content of Tab 1
              //     Center(child: Text('Tab 1 Content')),
              //
              //     // Content of Tab 2
              //     Center(child: Text('Tab 2 Content')),
              //
              //     // Content of Tab 3
              //     Center(child: Text('Tab 3 Content')),
              //   ],
              // ),
            ],
          )
        ],
      ),
    );
  }
}