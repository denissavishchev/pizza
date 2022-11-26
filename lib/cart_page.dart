import 'package:flutter/material.dart';
import 'package:pizza/constants.dart';
import 'package:pizza/pizza_model.dart';
import 'package:provider/provider.dart';


class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Consumer<Pizza>(
              builder: (context, value, child) {
                return Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 40),
                      width: MediaQuery.of(context).size.width,
                      height: 350,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(150), bottomRight: Radius.circular(150)),
                        color: kRed,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0,),
                            child: SizedBox(
                              // width: 350,
                              height: 270,
                              child: PageView.builder(
                                itemCount: value.cartImages.length,
                                  itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Column(
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: 240,
                                                  child: Image.asset(value.cartImages[index])),
                                              const SizedBox(height: 5,),
                                              Text(value.cartNames[index],
                                                style: const TextStyle(color: kWhite, fontSize: 18, fontWeight: FontWeight.bold
                                              ),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                  }),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        color: Colors.orange.withOpacity(0.8),
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                      ),
                    )
                  ],
                );
              })
        ],
      ),
    );
  }
}
