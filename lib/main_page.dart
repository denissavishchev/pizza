import 'package:flutter/material.dart';
import 'package:pizza/constants.dart';
import 'package:pizza/pizza_item_tile.dart';
import 'package:pizza/pizza_model.dart';
import 'package:provider/provider.dart';

import 'buttons.dart';
import 'cart_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite.withOpacity(0.8),
      body: Column(
        children: [
          Consumer<Pizza>(
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                child: ColoredBox(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Devis Pizza', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: kRed),),
                      Stack(
                        children: [
                          BasketButton(
                              onPressed: () =>
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const CartPage();
                                  }))
                          ),
                          Positioned(
                            top: 5,
                              right: 30,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: kWhite.withOpacity(0.8),
                                      blurRadius: 5
                                    ),
                                  ]
                                ),
                                child: Text(value.calculateTotalPrice(),
                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kRed),),
                              )),
                        ],
                      ),


                    ],
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: FutureBuilder<List<Pizza>>(
              future: PizzaApi.getPizza(context),
              builder: (context, snapshot) {
                final pizzas = snapshot.data;
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    return pizzaWidget(pizzas!);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget pizzaWidget(List<Pizza> pizzas) =>
      Consumer<Pizza>(
          builder: (context, value, index) {
            return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: pizzas.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.45,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 15),
                itemBuilder: (context, index) {
                  final pizza = pizzas[index];
                  return Stack(
                    children: [
                      PizzaItemTile(
                        name: pizza.pizzaName,
                        image: pizza.pizzaImage,
                        price: pizza.pizzaPrice,
                        onPressed: () {
                          //
                        },),
                      Positioned(
                        bottom: 2,
                        right: 2,
                        child: AddButton(
                          onPressed: () {
                            Provider.of<Pizza>(context, listen: false).addItemCart(
                                double.parse(pizza.pizzaPrice),
                            pizza.pizzaImage,
                            pizza.pizzaName);
                            Provider.of<Pizza>(context, listen: false).calculateTotalPrice();
                            // print(Provider.of<Pizza>(context, listen: false).calculateTotalPrice());
                          },),
                      ),
                    ],
                  );
                });

          }
      );

}

