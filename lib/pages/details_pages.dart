import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_travel_app_flutter/Colors/setColors.dart';
import 'package:new_travel_app_flutter/cubit/app_cubits.dart';
import 'package:new_travel_app_flutter/widgets/app_large_text.dart';
import 'package:new_travel_app_flutter/widgets/app_text.dart';
import 'package:new_travel_app_flutter/widgets/buttons/AppButtons.dart';
import 'package:new_travel_app_flutter/widgets/buttons/start_buttons.dart';

import '../cubit/app_cubit_state.dart';

class DetailsPages extends StatefulWidget {
  const DetailsPages({super.key});

  @override
  State<DetailsPages> createState() => _DetailsPagesState();
}

class _DetailsPagesState extends State<DetailsPages> {
  int gottenStar = 4;
  int selectedIndex=-1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit , CubitState>(
      builder: (context,state){
        DetailState detailState =state as DetailState;
        return  Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 350,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(detailState.place.appimgeUrl),
                            fit: BoxFit.cover,
                          )),
                    )),
                Positioned(
                    left: 20,
                    top: 40,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<AppCubit>(context).goHome();
                          },
                          icon: Icon(Icons.arrow_back),
                          color: Colors.black,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.notification_add_sharp),
                          color: Colors.black,
                        )
                      ],
                    )),
                Positioned(
                    top: 330,
                    bottom: 20,
                    child: Container(
                      padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 550,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ApplargeText(
                                  text: "Kagasumita",
                                  color: Colors.black.withOpacity(0.8),
                                ),
                                ApplargeText(
                                    text: "\$ 250", color: AppColors.maincolor),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.maincolor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                AppText(
                                  text: "TAYVET , Mondstadt",
                                  color: AppColors.textColor2,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Wrap(
                                  children: List.generate(5, (index) {
                                    return Icon(
                                      Icons.star,
                                      color: index < gottenStar
                                          ? AppColors.starcolors
                                          : Colors.grey,
                                    );
                                  }),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                AppText(
                                  text: "(4.0)",
                                  color: AppColors.textColor1,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            ApplargeText(
                              text: "People",
                              color: Colors.black.withOpacity(0.8),
                              size: 20,
                            ),
                            AppText(
                              text: "Number of people in your Group ",
                              color: Colors.grey,
                            ),
                            Wrap(
                              children: List.generate(5, (index) {
                                return InkWell(
                                  onTap: (){
                                    setState(() {
                                      selectedIndex=index;
                                    });
                                  },
                                  child: Container(
                                     margin: EdgeInsets.only(right: 5),
                                    child: AppButtons(size: 50,
                                      color:selectedIndex==index ?Colors.white:Colors.black,
                                      backgroundColor: selectedIndex==index ?Colors.black:AppColors.buttonBackground,
                                      borderColor: selectedIndex==index ?Colors.black:AppColors.buttonBackground ,
                                      text: (index+1).toString(),
                                      // isIcon: true,
                                      //  icon: Icons.favorite_border_outlined,
                                    ),
                                  ),
                                );
                              }),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ApplargeText(
                              text: "Description",
                              color: Colors.black.withOpacity(0.8),
                              size: 20,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppText(text: "He traveled the world gathering material for his book ,The birds are traveling south for the winter,Some visits can be for a combination of purposes.." ,color:Colors.grey,),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Row(
                              children: [
                                AppButtons(size: 50,
                                  color: AppColors.maincolor,
                                  backgroundColor: Colors.white,
                                  borderColor: AppColors.maincolor,
                                  isIcon: true,
                                  icon: Icons.favorite_border_outlined,
                                ),
                                SizedBox(width: 20,),
                                start_buttons(
                                  isResponsive: true,
                                  text: "Book Trips",
                                )
                              ],
                                                        ),
                            )
                          ],
                        ),
                      ),
                    )),

              ],
            ),
          ),
        );
      },
    ) ;

  }
}
