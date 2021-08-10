import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission_1/ui/restaurant_list_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return RestaurantListPage();
  }
}
