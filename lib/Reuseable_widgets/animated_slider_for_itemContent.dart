import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../AppReusableWidgets/WidgestsCustomeForApp.dart';
import '../Constants.dart';
import '../data_page_viewer.dart';


class MyCustomWidgetDataViewer extends StatefulWidget {
  List<dynamic> rondomKeysInPageMap;
  Map insideWebsitesmap;
  String userId;
  String PageName;

  MyCustomWidgetDataViewer({Key? key,required this.PageName,required this.userId,required this.rondomKeysInPageMap,required this.insideWebsitesmap,}) : super(key: key);

  @override
  State<MyCustomWidgetDataViewer> createState() => _MyCustomWidgetDataViewerState();
}

class _MyCustomWidgetDataViewerState extends State<MyCustomWidgetDataViewer> {
  @override
  void _showCopyMessage() {
    final snackBar = SnackBar(
      duration: Duration(milliseconds: 500),
      content: Text('Text copied to clipboard'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return AnimationLimiter(
      child: ListView.builder(
        padding: EdgeInsets.all(_w / 30),
        physics:
        BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: widget.rondomKeysInPageMap.length,
        itemBuilder: (BuildContext context, int index) {
          String itemRandomKey = widget.rondomKeysInPageMap[index];
          String emailOrPhone =
          widget.insideWebsitesmap[itemRandomKey]['email_phone'];
          String pass = widget.insideWebsitesmap[itemRandomKey]['pass'];
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
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: K_card_bg,
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(20))),
                          child: Column(
                            children: [
                              // const SizedBox(
                              //   height: 30,
                              // ),
                              Row(

                                  children: [
                                    PopupMenuButton<int>(
                                      itemBuilder: (context) => [
                                        // popupmenu item 1
                                        PopupMenuItem(
                                          value: 1,
                                          // row has two child icon and text.
                                          child: GestureDetector(
                                            onTap: (){
                                              showAlertDialog(
                                                  context,
                                                  widget.userId,
                                                  "besoes",
                                                  widget.PageName,
                                                  itemRandomKey);
                                            },
                                            child: Card(

                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                color: Colors.grey.withOpacity(0.9),
                                                child: Row(
                                                  children: [
                                                    Text("delete")
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                      offset: Offset(0, 50),
                                      color: Colors.grey,
                                      elevation: 2,
                                    ),
                                // IconButton(onPressed: (){}, icon: Icon(Icons.confirmation_num_sharp))
                              ]),
                              Row(
                                children: [
                                  Expanded(
                                    child: Card(
                                      color: K_card_listTile_color,
                                      child: ListTile(
                                        leading: const Icon(Icons.email),
                                        title: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Text(emailOrPhone),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        await Clipboard.setData(ClipboardData(
                                            text: emailOrPhone));
                                        _showCopyMessage();
                                      },
                                      icon: const Icon(Icons.copy))
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Card(

                                      color: K_card_listTile_color,
                                      child: ListTile(
                                        leading: Icon(MdiIcons.lock),
                                        title: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Text(pass),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        await Clipboard.setData(
                                            ClipboardData(text: pass));
                                        _showCopyMessage();
                                      },
                                      icon: const Icon(Icons.copy))
                                ],
                              ),
                            ],
                          ),
                        ),
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
