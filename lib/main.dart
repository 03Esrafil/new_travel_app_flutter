import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_travel_app_flutter/cubit/app_cubit_manage.dart';
import 'package:new_travel_app_flutter/cubit/app_cubits.dart';
import 'package:new_travel_app_flutter/pages/details_pages.dart';
import 'package:new_travel_app_flutter/pages/navigation/main_page.dart';
import 'package:new_travel_app_flutter/pages/welcome_pages.dart';
import 'package:new_travel_app_flutter/services/app_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider<AppCubit>(
        create:(context)=> AppCubit(
          data: dataServices(),
        ),
        child:  AppCubitManage(),
      ),
    );
  }
}

