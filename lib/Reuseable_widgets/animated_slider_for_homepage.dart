import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../AppReusableWidgets/WidgestsCustomeForApp.dart';
import '../data_page_viewer.dart';


class MyCustomWidget extends StatefulWidget {
  List<dynamic> dataCards;
  var dataFromDataBase;
  var userId;
   MyCustomWidget({Key? key,required this.dataCards,required this.dataFromDataBase,required this.userId}) : super(key: key);

  @override
  State<MyCustomWidget> createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return AnimationLimiter(
      child: ListView.builder(
        padding: EdgeInsets.all(_w / 30),
        physics:
        BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: widget.dataCards.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: Duration(milliseconds: 100),
            child: SlideAnimation(
              duration: Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,
              child: FadeInAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(milliseconds: 2500),
                child: Container(
                  margin: EdgeInsets.only(bottom: _w / 20),

                  child: Column(
                    children: [
                      ListTile(
                        onLongPress: () {


                          if (kDebugMode) {
                            print("long pressed");

                          }

                          showAlertDialog(context,null,"besoes",widget.dataCards[index],false);
                        },
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DataPage(userID: widget.userId,pagename:widget.dataCards[index],)));
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => DataPage(pagename: keys[index],)));

                        },
                        title: Row(
                          children: [
                            const Icon(Icons.accessibility_new_outlined),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the beginning
                                children: [
                                  Text(
                                    widget.dataCards[index],
                                    style: const TextStyle(fontSize: 20),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    widget.dataFromDataBase["websites"][widget.dataCards[index]].length.toString(),
                                    style: const TextStyle(fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 40,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



//
//
// class MyCustomWidget extends StatefulWidget {
//   @override
//   SlideAnimation3 createState() => SlideAnimation3();
// }
//
//
// class SlideAnimation3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double _w = MediaQuery.of(context).size.width;
//     return
//       AnimationLimiter(
//         child: ListView.builder(
//           padding: EdgeInsets.all(_w / 30),
//           physics:
//               BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
//           itemCount: 20,
//           itemBuilder: (BuildContext context, int index) {
//             return AnimationConfiguration.staggeredList(
//               position: index,
//               delay: Duration(milliseconds: 100),
//               child: SlideAnimation(
//                 duration: Duration(milliseconds: 2500),
//                 curve: Curves.fastLinearToSlowEaseIn,
//                 child: FadeInAnimation(
//                   curve: Curves.fastLinearToSlowEaseIn,
//                   duration: Duration(milliseconds: 2500),
//                   child: Container(
//                     margin: EdgeInsets.only(bottom: _w / 20),
//                     height: _w / 4,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 40,
//                           spreadRadius: 10,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       );
//
//   }
// }
