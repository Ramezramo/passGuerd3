import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';


class MakeChangesDBM{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String _userId;


  Future<String?> getCurrentUser() async {
    // THIS WILL RETURN USER ID IN SIGNED IN USERS
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      // The user is signed in.
      // print("The user is signed in." * 30);
      _userId = user.uid;
      return _userId;
      // print('Current User ID: $_userId');
    } else {
      // The user is signed out or not logged in.
      return "";
    }
  }

  Future<void> createDocumentWithUserId(collectionName) async {

    // FOR CREATING THE FIRST STEP WHICH IS WEBSITES' MAP
    if (_userId == null) {
      if (kDebugMode) {
        print('User ID is not available. Make sure the user is logged in.');
      }
      return;
    }

    try {
      DocumentReference documentReference =
      _firestore.collection(collectionName).doc(_userId); //TRY TO GET IN COLLECTION NAME WITH USER ID

      await documentReference.set({
        'websites': {
          "for_test": {
            "justcrator": {
              "name": "google",
              "pass": "123456789",
              "email_phone": "ramezmalak@gmail.com"
            }
          }
        },
        // Add more data as per your requirements
      });// WILL ADD THE FIRST MAP TO MAKE THE DATA BASE CONTROLLER KNOW ABOUT HOW DATA BE STORED

      if (kDebugMode) {
        print('Document with ID $_userId created successfully.');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error creating document: $e');
      }
    }
  }

  void settingUserId(collectionName) async {
    // HERE WILL MAKE A A BRUNCH IN THE COLLECTION WITH THE USER ID

    // in this will search by document
    // print("in get data doc " * 20);

    // print("in try " * 20);
    getCurrentUser();
    // print("_userId"*30);
    // print(_userId);
    DocumentReference doc =
    FirebaseFirestore.instance.collection(collectionName).doc(_userId);
    DocumentSnapshot snapshot = await doc.get();

    if (snapshot.exists) {
      // Collection and document exist
      if (kDebugMode) {
        print(snapshot.data());
      }
      // print("existed or no " * 20);
    } else {
      // Collection or document doesn't exist, create them
      await createDocumentWithUserId(collectionName);
      if (kDebugMode) {
        print("Created collection and document.");
      }
    }
  }

  Future<void> forceLogin() async {
    // IN THIS WILL AUTO SIGN IN FOR GETTING USER ID IN THE getCurrentUser()
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: "ramezmalak@gmail.com", password: "pass.toString()");
    } catch (e) {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "ramezmalak@gmail.com", password: "pass.toString()");
    }
  }






  String generateRandomKey() {
    const String _chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random _rnd = Random();
    String result = '';
    for (int i = 0; i < 7; i++) {
      result += _chars[_rnd.nextInt(_chars.length)];
    }
    return result;
  }

  getDataInsideASpesificKey() async {
    CollectionReference doc = FirebaseFirestore.instance.collection("besoes");
    await doc.where("age",isGreaterThanOrEqualTo: 20).get().then((value) {
      value.docs.forEach((element) {
        if (kDebugMode) {
          print(element.data());
        }
      });
    });
  }

  void getDateDoc() async {
    // in this will search by decument
    DocumentReference doc = FirebaseFirestore.instance.collection("besoes").doc("names_of_websites");
    await doc.get().then((value) {

      if (kDebugMode) {
        // print("users"*30);
        print(value.data());
        print(value.exists);// for checking if it existed or no
        print(value.id);
      }

    });
  }
  void addValueToaWebsite(pass,email,userId,collectionName,websiteName) async {
    // Replace 'Xv4Yac4wxxfM91uDknWGKA6nf4m1' with the ID of your desired document
    String documentId = userId;

    // Get a reference to the document you want to update
    DocumentReference documentRef = FirebaseFirestore.instance.collection(collectionName).doc(documentId);


    // Fetch the current data
    DocumentSnapshot snapshot = await documentRef.get();
    if (!snapshot.exists) {
      if (kDebugMode) {
        print('Document does not exist');
      }
      return;
    }

    // Get the data map from the snapshot
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    // Check if the 'websites' map exists
    if (data['websites'] == null) {
      // If 'websites' map doesn't exist, create it with the 'for_test' key
      data['websites'] = {'for_test': {}};
    }

    // Get the 'for_test' map
    appendDataToDatabase({"name": websiteName, "pass": pass,"email_phone":email},websiteName);
  }
  addNewPass(nameOrGmail,pass,email)async{
    // print("this is the nameOrGmail = ($nameOrGmail)");
    // print("this is the pass = ($pass)");
    // print("this is the email = ($email)");



    try {
      DocumentSnapshot documentSnapshot = await _firestore.collection('besoes').doc(_userId).get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
        documentSnapshot.data() as Map<String, dynamic>;
        // print(data);

        if (data['websites'] != null && data['websites'][nameOrGmail] != null) {

          // print("Key exists: ${data['websites'][nameOrGmail]}");
          await appendDataToDatabase({"name": nameOrGmail, "pass": pass,"email_phone":email},nameOrGmail);



        } else {
          // The key 'google' doesn't exist in the 'websites' map
          // print("will add it to data base");
          DocumentReference documentReference =
          _firestore.collection('besoes').doc(_userId);
          await documentReference.update({
            "websites.$nameOrGmail": {
              generateRandomKey(): {
                "name": nameOrGmail,
                "pass": pass,
                "email_phone": email
              }
            }
          });


        }
      } else {
        // Document does not exist
        // print("Document does not exist.");

      }
    } catch (e) {
      if (kDebugMode) {
        print("Error getting document: $e");
      }

    }
  }

  Future<void> appendDataToDatabase(value,key) async {
    try {
      // Reference to the document containing the 'websites' map
      DocumentReference documentRef = _firestore.collection('besoes').doc(_userId);

      // Get the current data of the document
      DocumentSnapshot documentSnapshot = await documentRef.get();

      if (documentSnapshot.exists) {
        // Extract the 'websites' map from the current data
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
        Map<String, dynamic> websites = data['websites'];

        // Check if 'google' exists in the 'websites' map
        if (websites.containsKey(key)) {
          // Extract the existing value of 'google' (which is another map)
          Map<String, dynamic> googleValue = websites[key];

          // Add the new data to the existing 'google' map
          googleValue[generateRandomKey()] = value;

          // Update the 'websites' map in the Firestore document
          await documentRef.update({'websites': websites});
          if (kDebugMode) {
            print("Appended data to $key successfully.");
          }
        } else {
          if (kDebugMode) {
            print("$key field does not exist.");
          }
        }
      } else {
        if (kDebugMode) {
          print("Document does not exist.");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error updating document: $e");
      }
    }
  }

  Future <void> deleteMap(collectionName,mapName)async{
    getCurrentUser();

    DocumentReference documentReference =
    FirebaseFirestore.instance.collection(collectionName).doc(_userId);

    // Update the document by removing the 'for_test' field

    await documentReference.update({
      'websites.$mapName': FieldValue.delete(),
    });
  }


  Future <void> deleteKeyinMap(userId,collectionName,mapName,key) async {
    // Replace 'Xv4Yac4wxxfM91uDknWGKA6nf4m1' with the ID of your desired document
    String documentId = userId;

    // Get a reference to the document you want to update
    DocumentReference documentRef = FirebaseFirestore.instance.collection(collectionName).doc(documentId);

    // Fetch the current data
    DocumentSnapshot snapshot = await documentRef.get();
    if (!snapshot.exists) {
      if (kDebugMode) {
        print('Document does not exist');
      }
      return;
    }

    // Get the data map from the snapshot
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    if (kDebugMode) {
      print(mapName);
      print(data['websites'][key]);
    }


    // Check if the 'for_test' key exists in the 'websites' map
    if (data['websites'] != null && data['websites'][mapName] != null) {
      // Remove the 'for_test' key from the 'websites' map
      data['websites'][mapName].remove(key);

      // Update the document with the modified data
      await documentRef.update(data);
      if (kDebugMode) {
        print('Key "for_test" deleted successfully');
      }
    } else {
      if (kDebugMode) {
        print('Key "for_test" does not exist in the document');
      }
    }
  }
  // Future <void> deleteKeyinMap(collectionName,mapName,key)async{
  //   getCurrentUser();
  //   print('the key from the function $key');
  //   DocumentReference documentReference =
  //   FirebaseFirestore.instance.collection(collectionName).doc(_userId);
  //   await documentReference.update({
  //     'websites.$mapName.$key': FieldValue.delete(),
  //   });
  // }



}