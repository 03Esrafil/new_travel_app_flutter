import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_travel_app_flutter/widgets/app_text.dart';

import '../../Colors/setColors.dart';

class AppButtons extends StatelessWidget {
  String? text;
  IconData? icon;
  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  bool? isIcon;

   AppButtons({super.key,
     this.isIcon=false,
     this.text="hi",
     this.icon,
     required this.size,
     required this.color,
     required this.backgroundColor,
     required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0
        ),
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor),
       child: isIcon==false?Center(child: AppText(text: text! ,color: color,)):Center(child: Icon(icon,color: color,)),
    );
  }
}
