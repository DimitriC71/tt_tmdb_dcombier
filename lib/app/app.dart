import 'package:flutter/material.dart';
import 'bottom_navigation_bar.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'Spot Discovery',
          color: Colors.green,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: BottomNavigationPage(),
        );
  }
}