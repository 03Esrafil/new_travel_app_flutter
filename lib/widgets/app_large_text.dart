import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ApplargeText extends StatelessWidget {
  double size;
  final String text;
  final Color color;

   ApplargeText({super.key,
      this.size=30,
     required this.text,
     this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),

    );
  }
}
