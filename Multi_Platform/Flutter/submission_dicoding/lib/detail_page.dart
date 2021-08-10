import 'package:flutter/material.dart';
import 'package:submission_dicoding/layout/background.dart';
import 'data/food.dart';

class DetailPage extends StatefulWidget {
  final Food food;
  DetailPage({required this.food});

  @override
  _DetailPageState createState() => _DetailPageState(food: food);
}

class _DetailPageState extends State<DetailPage> {
  final Food food;
  _DetailPageState({required this.food});

  int count = 0;

  Padding subPadding(String judul) => Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: Text(
          judul,
          style: TextStyle(
            fontFamily: 'PT Sans',
            fontSize: 18.0,
          ),
        ),
      );

  Padding contentPadding(List<String> items) => Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items
              .map(
                (item) => Container(
                  child: Text(
                    item,
                    style: TextStyle(fontSize: 14.0),
                    textAlign: TextAlign.justify,
                  ),
                ),
              )
              .toList(),
        ),
      );

  Padding contentPadding2(List<String> items) => Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            int countItem = 0;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items
                  .map((item) => LayoutBuilder(
                        builder: (context, constraints) {
                          countItem++;
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    '$countItem. ',
                                    style: TextStyle(fontSize: 14.0),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 12,
                                child: Container(
                                  child: Text(
                                    item,
                                    style: TextStyle(fontSize: 14.0),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ))
                  .toList(),
            );
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    Size constraints = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          food.nama,
          style: TextStyle(fontFamily: 'Otoman'),
        ),
      ),
      body: Stack(
        children: <Widget>[
          BackgroundLayout(),
          ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    height: constraints.width * 0.4,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          iconSize: constraints.width * 0.1,
                          onPressed: () {
                            setState(() {
                              if (count <= 0) {
                                count = food.imageAssets.length - 1;
                              } else {
                                count--;
                              }
                            });
                          },
                          icon: Icon(Icons.arrow_left_outlined),
                        ),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            if (constraints.maxWidth < 600.0) {
                              return Container(
                                width: constraints.maxWidth * 0.5,
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      offset: Offset(5.0, 5.0),
                                      blurRadius: 0.5,
                                      color: Colors.grey)
                                ]),
                                child: Image(
                                  image: AssetImage(food.imageAssets[count]),
                                ),
                              );
                            } else {
                              return Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      offset: Offset(5.0, 5.0),
                                      blurRadius: 0.5,
                                      color: Colors.grey)
                                ]),
                                child: Image(
                                  image: AssetImage(food.imageAssets[count]),
                                ),
                              );
                            }
                          },
                        ),
                        IconButton(
                          iconSize: constraints.width * 0.1,
                          onPressed: () {
                            setState(() {
                              if (count >= food.imageAssets.length - 1) {
                                count = 0;
                              } else {
                                count++;
                              }
                            });
                          },
                          icon: Icon(Icons.arrow_right_outlined),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: constraints.width * 0.85,
                    margin: EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: constraints.width * 0.15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        subPadding('Bahan - Bahan'),
                        contentPadding(food.bahan),
                        subPadding('Cara Pembuatan'),
                        contentPadding2(food.cara),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
