import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_travel_app_flutter/Colors/setColors.dart';
import 'package:new_travel_app_flutter/widgets/app_text.dart';

class start_buttons extends StatelessWidget {
  String? text;
  bool? isResponsive;
  double? width;
   start_buttons({super.key ,this.text, this.width=120,this.isResponsive=false});

  @override
  Widget build(BuildContext context) {
    return  Flexible(
      child: Container(
        width:isResponsive==true?double.maxFinite: width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.maincolor,
        ),

        child: Row(
          mainAxisAlignment: isResponsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
          children: [
            isResponsive==true?Container(margin:EdgeInsets.only(left: 20),child: AppText(text:text.toString(),color:Colors.white)):Container(),
             Container(margin:EdgeInsets.only(top:5,bottom:5,right: 20),child: Image.asset("images/button_icon.png",)),

          ],
        ),
      ),
    );
  }
}
