import 'package:flutter/material.dart';

class AlbumVerticalList extends StatefulWidget {
  const AlbumVerticalList({super.key});

  @override
  State<AlbumVerticalList> createState() => _AlbumVerticalListState();
}

class _AlbumVerticalListState extends State<AlbumVerticalList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.separated(
        itemCount: 10, // Replace with the desired number of items
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 1, // Adjust the height of the divider as needed
            color: Colors.grey, // Color of the divider
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 48.0,
                      width: 48.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 4,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                          "https://images.unsplash.com/photo-1695264474184-56e65adf126b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2574&q=80",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Column(
                      children: [
                        const Text(
                          "As it Was",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          "Harry styles",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                  ),
                  tooltip: 'Actions',
                  onPressed: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
