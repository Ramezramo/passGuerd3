// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAwHD757yOBWeLvm6xiKPLr_a-CM1kOFWo',
    appId: '1:635202139473:web:9bd0383d09dc55d8b88f70',
    messagingSenderId: '635202139473',
    projectId: 'beso-25b96',
    authDomain: 'beso-25b96.firebaseapp.com',
    storageBucket: 'beso-25b96.appspot.com',
    measurementId: 'G-HWMKW2FXX7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACgGQ0xq8f9_e4DGzq-ZYkeIsfo3Wq0Ig',
    appId: '1:635202139473:android:db6e47e7522082c1b88f70',
    messagingSenderId: '635202139473',
    projectId: 'beso-25b96',
    storageBucket: 'beso-25b96.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAAeBYnUzoH1yYDExJ-p03ppYKjkaB5kM',
    appId: '1:635202139473:ios:556dab69521e4292b88f70',
    messagingSenderId: '635202139473',
    projectId: 'beso-25b96',
    storageBucket: 'beso-25b96.appspot.com',
    iosClientId: '635202139473-9lnu1vhggs7pnflmhjj21eer1lein0ti.apps.googleusercontent.com',
    iosBundleId: 'com.example.passwordSaver',
  );
}