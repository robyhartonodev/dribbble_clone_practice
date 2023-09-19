import 'dart:ui';

import 'package:dribbble_clone_practice/coffee_app/pages/my_home_page.dart';
import 'package:dribbble_clone_practice/coffee_app/providers/coffee_app_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CoffeeAppStateProvider>(
          create: (context) => CoffeeAppStateProvider(),
        ),
        ChangeNotifierProvider<AppStateProvider>(
          create: (context) => AppStateProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      scrollBehavior: CustomScrollBehavior(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown.shade500),
        useMaterial3: true,
      ),
      home: const StartPage(),
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppStateProvider>(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              appState.setAppIndex(1);
              appState.setAppTitle('Coffee App');
            },
            child: Card(
              color: Colors.white,
              elevation: 4,
              child: Container(
                  height: 150,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: const Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.coffee,
                          color: Colors.brown,
                          size: 64.0,
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        Text(
                          'Coffee App',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  // Add new apps here
  List<Widget> apps = [const MainNavigationPage(), const MyHomePage()];

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppStateProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        shadowColor: Colors.black,
        title: Text(appState.appTitle),
        backgroundColor: Colors.orange,
        leading: (appState.appIndex > 0)
            ? IconButton(
                onPressed: () {
                  appState.setAppIndex(0);
                  appState.setAppTitle('UI App Compilations');
                },
                icon: const Icon(Icons.arrow_back),
              )
            : null,
      ),
      body: apps[appState.appIndex],
    );
  }
}

class AppStateProvider extends ChangeNotifier {
  int appIndex = 0;
  String appTitle = 'UI App Compilations';

  int get getAppIndex {
    return appIndex;
  }

  String get getAppTitle {
    return appTitle;
  }

  void setAppIndex(int newAppIndex) {
    appIndex = newAppIndex;
    notifyListeners();
  }

  void setAppTitle(String newAppTitle) {
    appTitle = newAppTitle;
    notifyListeners();
  }
}
