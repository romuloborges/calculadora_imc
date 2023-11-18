import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({
    required this.colour,
    required this.onTapFunction,
    this.cardChild,
  });

  final Color colour;
  Widget? cardChild;
  final void Function() onTapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}
