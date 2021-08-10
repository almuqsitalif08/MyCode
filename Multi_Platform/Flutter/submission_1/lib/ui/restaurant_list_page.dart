import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:submission_1/common/styles.dart';
import 'package:submission_1/data/model/restaurant.dart';
import 'package:submission_1/ui/restaurant_detail_page.dart';
import 'package:submission_1/widgets/platform_widget.dart';

class RestaurantListPage extends StatelessWidget {
  Widget _buildArticleItem(BuildContext context, Restaurant restaurant) {
    return Material(
      color: primaryColor,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: restaurant.pictureId,
          child: Image.network(
            restaurant.pictureId,
            width: 100,
            errorBuilder: (context, error, stackTrace) => Icon(Icons.android),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant.name,
              style: myTextTheme.headline6,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.grey,
                  size: 15,
                ),
                Text(
                  restaurant.city,
                  style: myTextTheme.caption,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
        subtitle: Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.grey,
              size: 20,
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              restaurant.rating.toString(),
              style: myTextTheme.caption,
            )
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, RestaurantDetailPage.routeName,
              arguments: restaurant);
        },
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/local_restaurant.json'),
      builder: (context, snapshot) {
        final List<Restaurant> articles = parseJson(snapshot.data);
        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return _buildArticleItem(context, articles[index]);
          },
        );
      },
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Restaurant',
                style: myTextTheme.headline4,
              ),
              Text(
                'Recommendation restaurant for you!',
                style: myTextTheme.subtitle1,
              )
            ],
          ),
        ),
        body: _buildList(context),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Restaurant',
              style: myTextTheme.headline4,
            ),
            Text(
              'Recommendation restaurant for you!',
              style: myTextTheme.subtitle1,
            )
          ],
        ),
        transitionBetweenRoutes: false,
      ),
      child: _buildList(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
