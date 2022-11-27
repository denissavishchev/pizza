import 'package:flutter/material.dart';
import 'dart:convert';

class Pizza extends ChangeNotifier {
  final String pizzaName;
  final String pizzaImage;
  final String pizzaPrice;

  Pizza({
    required this.pizzaName,
    required this.pizzaImage,
    required this.pizzaPrice,
  });

  static Pizza fromJson(json) =>
      Pizza(
        pizzaName: json['pizzaName'],
        pizzaImage: json['pizzaImage'],
        pizzaPrice: json['pizzaPrice'],
      );

  final List _drinks = [
    ['Pepsi', '1.5'],
    ['Merinda', '1.5'],
    ['7Up', '1.5'],
    ['CocaCola', '1.4'],
    ['Fanta', '1.4'],
    ['Sprite', '1.4'],
    ['Water', '0.5'],
    ['Tea', '2.0'],
    ['Coffee', '2.5'],
    ['Juice', '1.8'],
  ];
  final List _extras = [
    ['Fries', '2.4'],
    ['Onion', '1.4'],
    ['Muffin', '2.8'],
    ['IceCream', '2.1'],
    ['Jam', '1.0'],
    ['Cookie', '0.8'],
    ['Croissant', '1.6'],
    ['Brownie', '2.7'],
    ['Honey', '2.9'],
    ['Nachos', '1.4'],
  ];

  get drinks => _drinks;
  get extras => _extras;

  List cartItems = [];
  List cartImages = [];
  List cartNames = [];

  void addItemCart(double price, String image, String name) {
    cartItems.add(price);
    cartImages.add(image);
    cartNames.add(name);
    // print(cartItems);
    // print(cartImages);
    // print(cartNames);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice = cartItems.reduce((a, b) => a + b);
    }
    return totalPrice.toStringAsFixed(2);
  }

}

class PizzaApi {
  static Future<List<Pizza>> getPizza(BuildContext context) async {
    final assetBungle = DefaultAssetBundle.of(context);
    final data = await assetBungle.loadString('assets/pizza.json');
    final body = jsonDecode(data);
    return body.map<Pizza>(Pizza.fromJson).toList();
  }
  }

