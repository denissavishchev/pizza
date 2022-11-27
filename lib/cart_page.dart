import 'package:flutter/material.dart';
import 'package:pizza/constants.dart';
import 'package:pizza/main_page.dart';
import 'package:pizza/pizza_model.dart';
import 'package:provider/provider.dart';


class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10,),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const MainPage();
                })),
            child: SizedBox(
              width: 40,
              height: 40,
              child: Image.asset('assets/images/pizza.png'),
            ),
          ),
          Consumer<Pizza>(
              builder: (context, value, child) {
                return Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        itemCount: value.cartItems.length,
                          itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                            width: MediaQuery.of(context).size.width,
                            height: 70,
                            decoration: BoxDecoration(
                              color: kWhite,
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: kBlack.withOpacity(0.2),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                  offset: const Offset(1, 5),
                                )
                              ]
                            ),
                            child: ListTile(
                              leading: Container(
                                  decoration: BoxDecoration(
                                    // color: Colors.orange,
                                      borderRadius: const BorderRadius.all(Radius.circular(70)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: kBlack.withOpacity(0.3),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: const Offset(1, 2),
                                        )
                                      ]
                                  ),
                                  child: Image.asset(value.cartImages[index])),
                              title: Text(value.cartNames[index],
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              subtitle: Text('\$${value.cartItems[index]}'),
                              trailing: IconButton(icon: const Icon(Icons.cancel, size: 30, color: kRed,),
                                onPressed: () =>
                                    Provider.of<Pizza>(context, listen: false)
                                        .removeItemFromCart(index),
                              ),
                            ),
                          );
                          }),
                    ),
                  ],
                );
              })
        ],
      ),
    );
  }
}
