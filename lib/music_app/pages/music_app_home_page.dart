import 'package:dribbble_clone_practice/music_app/widgets/album_horizontal_list.dart';
import 'package:dribbble_clone_practice/music_app/widgets/album_vertical_list.dart';
import 'package:dribbble_clone_practice/music_app/widgets/search_field.dart';
import 'package:flutter/material.dart';

class MusicAppHomePage extends StatefulWidget {
  const MusicAppHomePage({super.key});

  @override
  State<MusicAppHomePage> createState() => _MusicAppHomePageState();
}

class _MusicAppHomePageState extends State<MusicAppHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(32.0),
              child: Image.asset(
                '/images/random_person_1.png',
                width: 32.0,
                height: 32.0,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const SearchField(),
              const SizedBox(
                height: 64.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Trending",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Show more",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 32.0,
              ),
              const AlbumHorizontalList(),
              const Text(
                "Recently Played",
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              const AlbumVerticalList(),
            ],
          ),
        ),
      ),
    );
  }
}
