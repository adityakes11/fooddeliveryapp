// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDds1SEiLrEjj2yjWlYTKuVOahT0F9pZL4',
    appId: '1:520512943464:web:3b61b02af68f0af10ed2dd',
    messagingSenderId: '520512943464',
    projectId: 'food-delivery11-8c339',
    authDomain: 'food-delivery11-8c339.firebaseapp.com',
    storageBucket: 'food-delivery11-8c339.firebasestorage.app',
    measurementId: 'G-KZG73Q87VW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCb_ogkyAlqOr1-Ll3JUeZZbPxdAKbw52Y',
    appId: '1:520512943464:android:4560d80542440c9c0ed2dd',
    messagingSenderId: '520512943464',
    projectId: 'food-delivery11-8c339',
    storageBucket: 'food-delivery11-8c339.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNgxR-QLZRPN3D6xY8GsMkxZi_ETkdLRU',
    appId: '1:520512943464:ios:4c14c79c224e3cb40ed2dd',
    messagingSenderId: '520512943464',
    projectId: 'food-delivery11-8c339',
    storageBucket: 'food-delivery11-8c339.firebasestorage.app',
    iosBundleId: 'com.example.test',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCNgxR-QLZRPN3D6xY8GsMkxZi_ETkdLRU',
    appId: '1:520512943464:ios:4c14c79c224e3cb40ed2dd',
    messagingSenderId: '520512943464',
    projectId: 'food-delivery11-8c339',
    storageBucket: 'food-delivery11-8c339.firebasestorage.app',
    iosBundleId: 'com.example.test',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDds1SEiLrEjj2yjWlYTKuVOahT0F9pZL4',
    appId: '1:520512943464:web:161bb3e584df23320ed2dd',
    messagingSenderId: '520512943464',
    projectId: 'food-delivery11-8c339',
    authDomain: 'food-delivery11-8c339.firebaseapp.com',
    storageBucket: 'food-delivery11-8c339.firebasestorage.app',
    measurementId: 'G-87JLZEZNHW',
  );
}