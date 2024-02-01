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
        return macos;
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
    apiKey: 'AIzaSyDst_p0sPZEogG91L14jpFyY1tozybIXKs',
    appId: '1:3615838141:web:40ec454d7e8f75a3230cd4',
    messagingSenderId: '3615838141',
    projectId: 'quiz-game-bb8ec',
    authDomain: 'quiz-game-bb8ec.firebaseapp.com',
    storageBucket: 'quiz-game-bb8ec.appspot.com',
    measurementId: 'G-NXZCCBC99V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_d4-Gk9VxAOVl-mR76sxZ0zXJRozPa04',
    appId: '1:3615838141:android:d7ba506b10cc8d86230cd4',
    messagingSenderId: '3615838141',
    projectId: 'quiz-game-bb8ec',
    storageBucket: 'quiz-game-bb8ec.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDHhIDjwjupFo-YGAWImJsvtrThyT4LU-w',
    appId: '1:3615838141:ios:91db4697f41f3209230cd4',
    messagingSenderId: '3615838141',
    projectId: 'quiz-game-bb8ec',
    storageBucket: 'quiz-game-bb8ec.appspot.com',
    iosBundleId: 'com.example.quizgames',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDHhIDjwjupFo-YGAWImJsvtrThyT4LU-w',
    appId: '1:3615838141:ios:589d6bfe85d6490c230cd4',
    messagingSenderId: '3615838141',
    projectId: 'quiz-game-bb8ec',
    storageBucket: 'quiz-game-bb8ec.appspot.com',
    iosBundleId: 'com.example.quizgames.RunnerTests',
  );
}
