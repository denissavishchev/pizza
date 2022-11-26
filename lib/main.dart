import 'package:flutter/material.dart';
import 'package:pizza/pizza_model.dart';
import 'package:provider/provider.dart';

import 'main_page.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
      home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Pizza(pizzaPrice: '', pizzaName: '', pizzaImage: ''),
      child: const SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainPage(),
        ),
      ),
    );
  }
}
