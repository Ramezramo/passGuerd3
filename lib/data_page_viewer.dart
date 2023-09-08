import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'AppReusableWidgets/WidgestsCustomeForApp.dart';
import 'AppReusableWidgets/myDrawer.dart';
import 'Constants.dart';
import 'Reuseable_widgets/animated_slider_for_itemContent.dart';
import 'Reuseable_widgets/myCatButton.dart';
import 'add_new_pass.dart';
import 'package:flutter/services.dart';

class DataPage extends StatefulWidget {
  // final Map dataFollow;
  final String pagename;
  final String userID;
  const DataPage({super.key, required this.userID, required this.pagename});
  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(widget.userID);
    }
    // List keysInDataFlow = widget.dataFollow.keys.toList();
    return Scaffold(
      // drawer: Drawer(
      //     child: appDrawer()
      // ),
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.pagename),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('besoes').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Error in database');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Check if the data contains the desired document
          DocumentSnapshot? desiredDocument;

          for (final document in snapshot.data!.docs) {
            if (document.id == widget.userID) {
              desiredDocument = document;
              break;
            }
          }

          if (desiredDocument == null) {
            return const Text('Document not found');
          }

          // Access the map from the desired document
          Map<String, dynamic> data =
              desiredDocument.data() as Map<String, dynamic>;
          Map<String, dynamic> websitesMap = data['websites'];

          // Now you can access the 'for_test' map
          Map<String, dynamic> insideWebsitesmap = websitesMap[widget.pagename];
          List rondomKeysInPageMap = insideWebsitesmap.keys.toList();

          return Column(
            children: [
              Expanded(

                child:MyCustomWidgetDataViewer(userId:widget.userID ,PageName: widget.pagename,rondomKeysInPageMap: rondomKeysInPageMap,insideWebsitesmap:insideWebsitesmap, ),
              ),
              const SizedBox(
                  height:
                      20), // Add some spacing between the ListView and the button
              MyButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => AddNewPass(
                            mainPageOrStackTF: false,
                            userId: widget.userID,
                            websiteName: widget.pagename,
                          ));
                },
                color: k_butom_color,
                title: const Text("add new password"),
                textcolor: Colors.black54,
                curveDegree: 2,
              ),
            ],
          );
        },
      ),
    );
  }
}
