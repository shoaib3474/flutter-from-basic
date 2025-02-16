import 'package:flutter/material.dart';
import 'package:flutter_from_basic/api/get_api.dart';
import 'package:flutter_from_basic/state_full_and_state_less/post_list_page.dart';

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
      home: GetApi(),
      debugShowCheckedModeBanner: false,
    );
  }
}
