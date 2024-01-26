import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_travel_app_flutter/Colors/setColors.dart';
import 'package:new_travel_app_flutter/cubit/app_cubits.dart';
import 'package:new_travel_app_flutter/widgets/app_large_text.dart';
import 'package:new_travel_app_flutter/widgets/app_text.dart';
import 'package:new_travel_app_flutter/widgets/buttons/start_buttons.dart';

class WelcomePages extends StatefulWidget {
  const WelcomePages({super.key});

  @override
  State<WelcomePages> createState() => _WelcomePagesState();
}

class _WelcomePagesState extends State<WelcomePages> {
  List images=[
    "images_1.jpg",
    "images_2.jpg",
    "images_4.jpg"
  ];
  List Maintext=[
    "Mountains",
    "Moons And Stars",
    "City"
  ];
  List subtext=[
    "Mountain hikes give you incredible sense of freedom  along with endurance test .",
    "It is the night of a full moon, and the moonlight is used to power the jewel   .",
    "My awesome city is the place where we find ourselves breath out happily   ."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_,index){
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "images/"+images[index],
              ),
              fit: BoxFit.cover
            )
          ),

          child: Container(
            margin:const EdgeInsets.only(top: 100,left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ApplargeText(text: "Trips "),
                    AppText(text: Maintext[index],size: 30,),
                    SizedBox(height: 20,),
                    Container(
                      width: 250,
                      child: AppText(
                          text: subtext[index],
                          color: AppColors.textColor2,
                      ),
                    ),
                    SizedBox(height: 40,),
                    GestureDetector(
                      onTap: (){
                        BlocProvider.of<AppCubit>(context).getData();
                      },
                        child: Container(
                          width: 200,
                            child: Row(
                          children: [
                            start_buttons(width: 120,),
                          ],
                        ))),
                  ],
                ),
                Column(
                  children: List.generate(3, (indexDotsilder){
                    return Container(
                      margin:EdgeInsets.only(bottom: 3),
                      width: 8,
                      height: index==indexDotsilder?25:8,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:index==indexDotsilder? AppColors.maincolor:AppColors.maincolor.withOpacity(0.5),
                      ),
                    );
                  }),
                )

              ],
            ),
          ),

        );
      })


    );
  }
}
