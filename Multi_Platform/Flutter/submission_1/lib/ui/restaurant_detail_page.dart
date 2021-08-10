import 'package:flutter/material.dart';
import 'package:submission_1/common/styles.dart';
import 'package:submission_1/data/model/restaurant.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';

  final Restaurant restaurant;

  const RestaurantDetailPage({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: restaurant.pictureId,
              child: ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20.0)),
                  child: Image.network(
                    restaurant.pictureId,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.android),
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      restaurant.name,
                      style: myTextTheme.headline5,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.location_on,
                          color: Colors.grey,
                          size: 15,
                        ),
                      ),
                      Container(
                        child: Text(
                          restaurant.city,
                          style: myTextTheme.caption,
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Description',
                      style: myTextTheme.headline6,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      restaurant.description,
                      style: myTextTheme.bodyText1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      'Food\'s Menu',
                      style: myTextTheme.headline6,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: restaurant.menus['foods']
                          .map<Widget>(
                            (food) => Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      food,
                                      style: myTextTheme.subtitle1,
                                    ),
                                    Text(
                                      'Rp.15000',
                                      style: myTextTheme.subtitle2,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      'Drink\'s Menu',
                      style: myTextTheme.headline6,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: restaurant.menus['drinks']
                          .map<Widget>(
                            (drink) => Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      drink,
                                      style: myTextTheme.subtitle1,
                                    ),
                                    Text(
                                      'Rp5000',
                                      style: myTextTheme.subtitle2,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Back',
                        style: myTextTheme.button,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
