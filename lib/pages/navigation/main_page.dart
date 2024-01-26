import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_travel_app_flutter/pages/navigation/bar_item_page.dart';
import 'package:new_travel_app_flutter/pages/home_page.dart';
import 'package:new_travel_app_flutter/pages/navigation/my_page.dart';
import 'package:new_travel_app_flutter/pages/navigation/search_page.dart';

class mainPage extends StatefulWidget {

   mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  List pages=[
       homePage(),
       bar_item(),
       search_page(),
       my_page()
  ];
  int currentIdex=0;
   void onTap(int index){
      setState(() {
        currentIdex=index;
      });
   }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body:pages[currentIdex] ,
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIdex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label: "Home",icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label: "Bar",icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(label: "Search",icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: "My",icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
