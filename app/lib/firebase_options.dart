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
    apiKey: 'AIzaSyDh465ZIp0tUhcYYyaMAJSdDaTuH2btndc',
    appId: '1:309078044831:web:26f3c7cfda9e5f1c25b2aa',
    messagingSenderId: '309078044831',
    projectId: 'inventory-paradise-fb',
    authDomain: 'inventory-paradise-fb.firebaseapp.com',
    storageBucket: 'inventory-paradise-fb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBFji3ovS17gMc22JV73kAE4OsGAqhIZzQ',
    appId: '1:309078044831:android:cb08b3845c63efcd25b2aa',
    messagingSenderId: '309078044831',
    projectId: 'inventory-paradise-fb',
    storageBucket: 'inventory-paradise-fb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQhqDhluVH6V08YAa-vNCUK9niONGY07I',
    appId: '1:309078044831:ios:da6cde8b1704715025b2aa',
    messagingSenderId: '309078044831',
    projectId: 'inventory-paradise-fb',
    storageBucket: 'inventory-paradise-fb.appspot.com',
    iosClientId:
        '309078044831-elrrlc21go0irdktj4c94smj5b974mja.apps.googleusercontent.com',
    iosBundleId: 'com.ucdavisgdsc.paradise.inventory',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAQhqDhluVH6V08YAa-vNCUK9niONGY07I',
    appId: '1:309078044831:ios:da6cde8b1704715025b2aa',
    messagingSenderId: '309078044831',
    projectId: 'inventory-paradise-fb',
    storageBucket: 'inventory-paradise-fb.appspot.com',
    iosClientId:
        '309078044831-elrrlc21go0irdktj4c94smj5b974mja.apps.googleusercontent.com',
    iosBundleId: 'com.ucdavisgdsc.paradise.inventory',
  );
}
