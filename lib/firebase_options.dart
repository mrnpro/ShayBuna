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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCRj3elRBVcEZT1zjhmWAQ-h17upTIDAeI',
    appId: '1:396073457231:android:3da760ad63f82f2de8fc3a',
    messagingSenderId: '396073457231',
    projectId: 'flutter-326720',
    databaseURL: 'https://flutter-326720-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-326720.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDskFuRL3uTE5Dzx4E5yqzzsNyo7_4Rspk',
    appId: '1:396073457231:ios:3040c4b663fc84b4e8fc3a',
    messagingSenderId: '396073457231',
    projectId: 'flutter-326720',
    databaseURL: 'https://flutter-326720-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-326720.appspot.com',
    androidClientId: '396073457231-0lrtvk35dhr7rdcbespckjd94htnaqm9.apps.googleusercontent.com',
    iosBundleId: 'com.example.coffeeShop',
  );
}