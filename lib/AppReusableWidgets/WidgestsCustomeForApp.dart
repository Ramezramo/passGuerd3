import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../DATABASECONTROLERS/MakeChangesInDataBase.dart';

MakeChangesDBM _changesDB_M = MakeChangesDBM();
void showAlertDialog(
    BuildContext context, userId,collectionName, mapName, theRandomKey) {
  // Create the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Alert"),
    content: const Text("do you want to delete"),
    actions: [
      // Add buttons to the bottom of the dialog
      TextButton(
        child: const Text("ok"),
        onPressed: () {
          if (kDebugMode) {
            print(theRandomKey);
          }
          theRandomKey == false
              ?
          _changesDB_M.deleteMap(collectionName, mapName)
              : _changesDB_M.deleteKeyinMap(userId,
                  collectionName, mapName, theRandomKey);

          Navigator.of(context).pop(); // Close the dialog
        },
      ),
      TextButton(
        child: const Text("Close"),
        onPressed: () {
          Navigator.of(context).pop(); // Close the dialog
        },
      ),
    ],
  );

  // Show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
