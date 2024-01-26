import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_travel_app_flutter/cubit/app_cubits.dart';
import 'package:new_travel_app_flutter/pages/home_page.dart';
import 'package:new_travel_app_flutter/pages/welcome_pages.dart';

import '../pages/details_pages.dart';
import 'app_cubit_state.dart';

class AppCubitManage extends StatefulWidget {
  const AppCubitManage({super.key});

  @override
  State<AppCubitManage> createState() => _AppCubitManageState();
}

class _AppCubitManageState extends State<AppCubitManage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit ,CubitState>(
        builder: ( context,  state) {
          if(state is WelcomeState){
            return WelcomePages();
          }if(state is LoadedState){
            return homePage();
          }if(state is LoadinState){
            return Center(child:  CircularProgressIndicator(),);
          } if(state is DetailState){
            return DetailsPages();
          }
          else{
            return Container(

            ) ;
          }

        },

      )

    );
  }
}
