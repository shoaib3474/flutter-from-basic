import 'package:flutter/material.dart';
import 'package:flutter_from_basic/flex_layout/home_page.dart';

void main() {
  runApp(MyApp());
}
//MaterialApp features
//  theme
//  navigator
//  localization

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //materialApp is app container
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
