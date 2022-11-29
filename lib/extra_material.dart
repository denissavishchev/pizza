import 'package:flutter/material.dart';
import 'package:pizza/constants.dart';

class ExtraMaterials extends StatefulWidget {

  final String text;
  final String price;

  ExtraMaterials({Key? key,
    required this.text,
    required this.price,
  }) : super(key: key);

  @override
  State<ExtraMaterials> createState() => _ExtraMaterialsState();
}

class _ExtraMaterialsState extends State<ExtraMaterials> {
  bool isPressed = false;

  void onTap(){
    setState((){
      isPressed = !isPressed;
    });

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 6),
        width: 150,
        height: 50,
        color: kWhite,
        child: Row(
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: kBlack.withOpacity(0.3),
                    blurRadius: 2,
                    spreadRadius: 1,
                    offset: const Offset(2, 2),
                  ),
                ]
              ),
              child: Center(
                  child: Icon(Icons.check,
                  color: isPressed ? kRed : kWhite,)),
            ),
            const SizedBox(width: 5,),
            Text(widget.text, style: TextStyle(color: isPressed ? kRed : kBlack, fontWeight: FontWeight.bold),),
            Text(' + ${widget.price} \$', style: TextStyle(color: isPressed ? kRed : kBlack, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
