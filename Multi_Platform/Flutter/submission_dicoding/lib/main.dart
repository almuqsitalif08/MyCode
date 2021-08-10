import 'package:flutter/material.dart';
import 'package:submission_dicoding/data/food.dart';
import 'package:submission_dicoding/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final food = foodList[0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyFood',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
