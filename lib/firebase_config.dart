import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (kIsWeb) {
      // Web
      return const FirebaseOptions(
        apiKey: 'AIzaSyBLnU1cP-xzr6gPAwXE0saP0SMZouc7kVY',
        appId: '1:892102216572:web:5a2b8ed301f02aabf4f2f9',
        messagingSenderId: '892102216572',
        projectId: 'nyu-trade-2021',
        authDomain: 'nyu-trade-2021.firebaseio.com',
      );
    }
    else if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        apiKey: 'AIzaSyAHAsf51D0A407EklG1bs-5wA7EbyfNFg0',
        appId: '1:448618578101:ios:4cd06f56e36384acac3efc',
        messagingSenderId: '448618578101',
        projectId: 'react-native-firebase-testing',
        authDomain: 'react-native-firebase-testing.firebaseapp.com',
        iosBundleId: 'io.flutter.plugins.firebase.auth',
        databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
        iosClientId:
        '448618578101-m53gtqfnqipj12pts10590l37npccd2r.apps.googleusercontent.com',
        androidClientId:
        '448618578101-26jgjs0rtl4ts2i667vjb28kldvs2kp6.apps.googleusercontent.com',
        storageBucket: 'react-native-firebase-testing.appspot.com',
      );
    } else {
      // Android
      return const FirebaseOptions(
        apiKey: 'AIzaSyCuu4tbv9CwwTudNOweMNstzZHIDBhgJxA',
        appId: '1:448618578101:android:9d44a7b85d1ab0baac3efc',
        messagingSenderId: '448618578101',
        projectId: 'react-native-firebase-testing',
        authDomain: 'react-native-firebase-testing.firebaseapp.com',
        databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
        androidClientId:
        '448618578101-qd7qb4i251kmq2ju79bl7sif96si0ve3.apps.googleusercontent.com',
      );
    }
  }
}