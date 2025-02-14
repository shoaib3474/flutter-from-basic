import 'package:flutter/material.dart';
import 'package:flutter_from_basic/flex_layout/home_page.dart';
import 'package:flutter_from_basic/state_full_and_state_less/main_page.dart';

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
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
