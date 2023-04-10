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
    apiKey: 'AIzaSyDbdifOtR6ES_Ermqsg5MeYr4PXP9LAsyg',
    appId: '1:983913470951:web:86b188017075f9fe4dfb42',
    messagingSenderId: '983913470951',
    projectId: 'authentication-page-44a56',
    authDomain: 'authentication-page-44a56.firebaseapp.com',
    storageBucket: 'authentication-page-44a56.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBAsPEYLo09506jlB-1NzqCXXH6HMO0n5E',
    appId: '1:983913470951:android:0e0e0948c86647034dfb42',
    messagingSenderId: '983913470951',
    projectId: 'authentication-page-44a56',
    storageBucket: 'authentication-page-44a56.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPDFZSK34lYabwp5_L0Zhl3bVyRLy5eN8',
    appId: '1:983913470951:ios:78302132371a68104dfb42',
    messagingSenderId: '983913470951',
    projectId: 'authentication-page-44a56',
    storageBucket: 'authentication-page-44a56.appspot.com',
    iosClientId: '983913470951-cieb43anurn7fuuguers5b3q7lb74dt6.apps.googleusercontent.com',
    iosBundleId: 'com.example.authenticationApp',
  );
}