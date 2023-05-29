import 'package:flutter/material.dart';

class QuickLinks extends StatelessWidget {
  final String image;
  final Color color;
  const QuickLinks({
    Key? key,
    required this.image,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Image.asset(
          image,
          scale: 0.8,
        ),
      ),
    );
  }
}
