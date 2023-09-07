


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:password_saver/data_page_viewer.dart';
import 'AppReusableWidgets/myDrawer.dart';
import 'Constants.dart';
import 'Reuseable_widgets/animated_slider_for_homepage.dart';
import 'add_new_pass.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'DATABASECONTROLERS/MakeChangesInDataBase.dart';
import 'AppReusableWidgets/WidgestsCustomeForApp.dart';


MakeChangesDBM _changesDB_M = MakeChangesDBM();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'password guard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'my password guard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Map<String, dynamic> data;
  late String _userID;


  Future<void> userID() async {
    _userID =  (await _changesDB_M.getCurrentUser())!;
  }





@override
  void initState() {
    // TODO: implement initState
    super.initState();
    userID();
  }
  @override
  Widget build(BuildContext context) {
    _changesDB_M.forceLogin();
    _changesDB_M.settingUserId("besoes");

    return buildScaffold(context);
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: k_butom_color,
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => AddNewPass(mainPageOrStackTF: true,));
        },
      ),
      drawer: Drawer(
        child: appDrawer(context)
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('besoes').snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {


            return const Text('Error in database');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // List messageBubbles = [];
          DocumentSnapshot? desiredDocument;

          for (final document in snapshot.data!.docs) {
            if (document.id == _userID) {
              desiredDocument = document;
              break;
            }
          }

          if (desiredDocument == null) {
            return const Text('Document not found');
          }
          Map<String, dynamic> data =
          desiredDocument.data() as Map<String, dynamic>;
          Map<String, dynamic> insideWebsitesmap = data["websites"];
          List websitesNames = insideWebsitesmap.keys.toList();

          if (kDebugMode) {
            print("websitesNames");
            print(websitesNames);
          }

          return MyCustomWidget(dataCards: websitesNames,dataFromDataBase: data,userId: _userID,);

        },
      ));
  }
}
