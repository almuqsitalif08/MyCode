import 'dart:convert';

class Restaurant {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late double rating;
  late Map menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  Restaurant.fromJson(Map<String, dynamic> restaurant) {
    id = restaurant['id'];
    name = restaurant['name'];
    description = restaurant['description'];
    pictureId = restaurant['pictureId'];
    city = restaurant['city'];
    rating = restaurant['rating'].toDouble();
    menus = restaurant['menus'];

    List foods = [];
    for (int count = 0; count < menus['foods'].length; count++) {
      foods.add(menus['foods'][count]['name']);
    }

    List drinks = [];
    for (int count = 0; count < menus['drinks'].length; count++) {
      drinks.add(menus['drinks'][count]['name']);
    }

    menus['foods'] = foods;
    menus['drinks'] = drinks;
  }
}

List<Restaurant> parseJson(String? json) {
  if (json == null) {
    return [];
  }

  final Map restaurants = jsonDecode(json);
  final List parsed = restaurants['restaurants'];
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}
