import 'package:flutter/material.dart';
import 'screens/home_page.dart';
//import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(HomePageUI());
}

class HomePageUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page UI',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        hintColor: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}



