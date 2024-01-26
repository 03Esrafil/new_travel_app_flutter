import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_travel_app_flutter/Colors/setColors.dart';
import 'package:new_travel_app_flutter/cubit/app_cubit_state.dart';
import 'package:new_travel_app_flutter/cubit/app_cubits.dart';

import 'package:new_travel_app_flutter/widgets/app_large_text.dart';
import 'package:new_travel_app_flutter/widgets/app_text.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> with TickerProviderStateMixin {
  var images={
    "fontain_1.jpg":"Fontain",
    "liyu_1.jpg":"Liyu",
    "Mondstadt_1.jpg":"Mondstadt",
    "images_two.jpg":"beauty nature",

  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
       body:  BlocBuilder<AppCubit , CubitState>(
         builder:  (context, state){
           if (state is LoadedState){
             var info = state.places;
             return  SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                     padding: EdgeInsets.only(top: 40, left: 20),
                     child: Row(
                       children: [
                         Icon(
                           Icons.menu,
                           size: 30,
                           color: Colors.black54,
                         ),
                         Expanded(child: Container()),
                         Container(
                           margin: EdgeInsets.only(right: 20),
                           width: 40,
                           height: 40,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             color: Colors.grey,
                           ),
                         )
                       ],
                     ),
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Container(
                       padding: EdgeInsets.only(left: 20),
                       child: ApplargeText(
                         text: "Discorver",
                       )),
                   SizedBox(
                     height: 20,
                   ),
                   Container(
                     child: Align(
                       alignment: Alignment.centerLeft,
                       child: TabBar(
                         dividerColor: Colors.transparent,
                         indicator:
                         circuindecator(color: AppColors.maincolor, raidous: 4),
                         controller: _tabController,
                         tabAlignment: TabAlignment.start,
                         labelPadding: EdgeInsets.only(left: 20, right: 20),
                         indicatorSize: TabBarIndicatorSize.label,
                         labelColor: Colors.black54,
                         unselectedLabelColor: Colors.grey,
                         isScrollable: true,
                         tabs: [
                           Tab(
                             text: "Places",
                           ),
                           Tab(
                             text: "Inspration",
                           ),
                           Tab(
                             text: "Emotions",
                           ),
                         ],
                       ),
                     ),
                   ),
                   Container(
                     margin: EdgeInsets.only(left: 20),
                     height: 300,
                     width: double.maxFinite,
                     child: TabBarView(controller: _tabController,
                         children: [
                       ListView.builder(
                         itemCount: info.length,
                         scrollDirection: Axis.horizontal,
                         itemBuilder: (BuildContext context, int index) {
                           return GestureDetector(
                             onTap: (){
                               BlocProvider.of<AppCubit>(context).detailsPage(info[index]);
                             },
                             child: Container(
                               margin: EdgeInsets.only(right: 20, top: 10),
                               width: 200,
                               height: 300,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(20),
                                   color: Colors.white,
                                   image: DecorationImage(
                                     image:  NetworkImage(info[index].appimgeUrl),
                                     // image: AssetImage("images/images_three.jpg"),
                                     fit: BoxFit.cover,
                                   )),
                             ),
                           );
                         },
                       ),
                       Text(" welcome"),
                       Text(" byee"),
                     ]
                     ),
                   ),
                   SizedBox(
                     height: 30,
                   ),
                   Container(
                     margin: EdgeInsets.only(left: 20, right: 20),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         ApplargeText(
                           text: "Explore more",
                           size: 20,
                         ),
                         AppText(
                           text: "See all",
                           color: AppColors.textColor1,
                         )
                       ],
                     ),
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Container(
                     height: 120,
                     width: double.maxFinite,
                     margin: EdgeInsets.only(left: 20),
                     child: ListView.builder(
                         itemCount: 4,
                         scrollDirection: Axis.horizontal,
                         itemBuilder: (_, index) {
                           return Container(
                             margin: EdgeInsets.only(right: 30),
                             child: Column(
                               children: [
                                 Container(
                                   // margin: EdgeInsets.only(right: 50, ),
                                   width: 80,
                                   height: 80,
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(20),
                                       color: Colors.white,
                                       image: DecorationImage(
                                         image: AssetImage("images/"+images.keys.elementAt(index)),
                                         fit: BoxFit.cover,
                                       )),
                                 ),
                                 SizedBox(
                                   height: 10,
                                 ),
                                 Container(
                                   child: AppText(text: images.values.elementAt(index),color: AppColors.textColor2,),
                                 )
               
                               ],
                             ),
                           );
                         }),
                   )
                 ],
               ),
             );
           }else{
             return Container();
           }

         },
       ),

    );
  }
}

class circuindecator extends Decoration {
  final Color color;
  double raidous;

  circuindecator({required this.color, required this.raidous});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _circulPainter(color: color, raidous: raidous);
  }
}

class _circulPainter extends BoxPainter {
  final Color color;
  double raidous;

  _circulPainter({required this.color, required this.raidous});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    final Offset circleOffset = Offset(configuration.size!.width / 2 - raidous,
        configuration.size!.height - raidous);
    canvas.drawCircle(offset + circleOffset, raidous, _paint);
  }
}
