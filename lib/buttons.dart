import 'package:flutter/material.dart';
import 'package:pizza/constants.dart';

class SizeButton extends StatelessWidget {

  final String text;
  final Function() onPress;
  final bool isPressed;

    const SizeButton({Key? key,
    required this.text,
    required this.onPress,
    required this.isPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
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
    );
  }
}

class AddButton extends StatefulWidget {
  final Function() onPressed;
  const AddButton({Key? key, 
    required this.onPressed}) : super(key: key);

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {

  bool isTapped = false;

  void _isTapped() {
    setState(() {
      isTapped = !isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (_){widget.onPressed(); _isTapped();},
      onTapDown: (_){_isTapped();},
      onTapCancel: (){_isTapped();},
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: kRed,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: isTapped ? kRed : Colors.transparent,
              blurRadius: 3,
              offset: const Offset(0.5, 0.5)
            )
          ]
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class BasketButton extends StatelessWidget {
  void Function()? onPressed;
  BasketButton({Key? key,
  required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: GestureDetector(
        onTap: onPressed,
        child: SizedBox(
          width: 100,
          height: 50,
          child: Image.asset('assets/images/basket.png'),
        ),
      ),
    );
  }
}

class OrderButton extends StatelessWidget {
  const OrderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        color: kRed,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: kWhite, width: 2),
        boxShadow: [
          BoxShadow(
            color: kBlack.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(1, 2)
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/deliver.png'),
          Text('Order', style: const TextStyle(color: kWhite, fontSize: 24, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}



