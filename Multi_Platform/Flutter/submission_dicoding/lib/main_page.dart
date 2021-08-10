import 'package:flutter/material.dart';
import 'package:submission_dicoding/data/food.dart';
import 'package:submission_dicoding/detail_page.dart';
import 'package:submission_dicoding/layout/background.dart';
import 'package:submission_dicoding/login_page.dart';

class MainPage extends StatelessWidget {
  final String nama;
  MainPage({required this.nama});

  Widget placeGrid(BuildContext context, int gridCount) {
    return Scrollbar(
      isAlwaysShown: (gridCount >= 4) ? true : false,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.count(
          crossAxisCount: gridCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: foodList.map((food) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(food: food),
                  ),
                );
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.asset(
                        food.imageAssets[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      margin: EdgeInsets.only(bottom: 4.0),
                      child: Center(
                        child: Text(
                          food.nama,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Selamat Datang $nama',
          style: TextStyle(fontFamily: 'PT Sans', fontSize: 24.0, shadows: [
            Shadow(
                offset: Offset(2.0, 2.0), color: Color.fromARGB(100, 0, 0, 0)),
          ]),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 5.0, top: 10.0, bottom: 10.0),
            padding: EdgeInsets.all(0.0),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 205, 30, 30)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)))),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
              child: Text(
                'Log Out',
                style: TextStyle(fontFamily: 'Garamond', fontSize: 20.0),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          LayoutBuilder(builder: (context, constraint) => BackgroundLayout()),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 500) {
                return placeGrid(context, 2);
              }
              if (constraints.maxWidth < 1000) {
                return placeGrid(context, 3);
              } else {
                return placeGrid(context, 4);
              }
            },
          ),
        ],
      ),
    );
  }
}
