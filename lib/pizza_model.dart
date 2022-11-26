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
  List cartItems = [];
  List cartImages = [];
  List cartNames = [];

  void addItemCart(double price, String image, String name) {
    cartItems.add(price);
    cartImages.add(image);
    cartNames.add(name);
    print(cartItems);
    print(cartImages);
    print(cartNames);
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

