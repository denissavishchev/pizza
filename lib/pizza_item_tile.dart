import 'package:flutter/material.dart';
import 'package:pizza/constants.dart';
import 'package:pizza/pizza_model.dart';
import 'buttons.dart';
import 'package:provider/provider.dart';

enum ButtonSize {
  small,
  medium,
  large,
}

class PizzaItemTile extends StatefulWidget {

  final String name;
  final String image;
  final String price;
  final Function()? onPressed;

  const PizzaItemTile({Key? key,
    required this.name,
    required this.image,
    required this.price,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<PizzaItemTile> createState() => _PizzaItemTileState();
}

class _PizzaItemTileState extends State<PizzaItemTile> {

  dynamic selectedSize = ButtonSize.small;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: kBlack.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(5, 5),
          )
        ]
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Image.asset(widget.image),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizeButton(text: 'S',
                          isPressed: selectedSize == ButtonSize.small ? true : false,
                          onPress: () {
                          setState(() {
                            selectedSize = ButtonSize.small;
                          });
                          },),
                        SizeButton(text: 'M',
                          isPressed: selectedSize == ButtonSize.medium ? true : false,
                          onPress: () {
                            setState(() {
                              selectedSize = ButtonSize.medium;
                            });
                          },),
                        SizeButton(text: 'L',
                          isPressed: selectedSize == ButtonSize.large ? true : false,
                          onPress: () {
                            setState(() {
                              selectedSize = ButtonSize.large;
                            });
                          },),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(widget.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kBlack),),
                  const SizedBox(height: 15,),
                  SizedBox(
                    width: 110,
                    child: Row(
                      children: [
                        Text('\$ ${widget.price}', style: const TextStyle(color: kRed, fontSize: 18, fontWeight: FontWeight.bold),),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 3,)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
