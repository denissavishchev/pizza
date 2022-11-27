import 'package:flutter/material.dart';
import 'package:pizza/constants.dart';

class ExtraMaterials extends StatelessWidget {

  final String text;
  final String price;

  ExtraMaterials({Key? key,
    required this.text,
    required this.price,
  }) : super(key: key);

  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 150,
        height: 50,
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                boxShadow: isPressed ? [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 15,
                    offset: const Offset(2, 2),
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    blurRadius: 15,
                    offset: Offset(-2, -2),
                  ),
                ] : [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 15,
                    offset: const Offset(5, 5),
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    blurRadius: 15,
                    offset: Offset(-5, -5),
                  ),
                ],
                gradient: isPressed ? LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Colors.white.withOpacity(0.8),
                    Colors.grey.shade500.withOpacity(0.8),
                  ],
                  stops: const [
                    0.1,
                    1,
                  ],
                ) : null,
              ),
              child: Center(child: Text(text)),
            ),
            Text(text),
            Text(price),
          ],
        ),
      ),
    );
  }
}
