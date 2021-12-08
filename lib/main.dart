import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBLnU1cP-xzr6gPAwXE0saP0SMZouc7kVY',
      authDomain: 'nyuad-trade-2021.firebaseapp.com',
      databaseURL: 'https://nyu-trade-2021-default-rtdb.firebaseio.com/',
      projectId: 'nyuad-trade-2021',
      messagingSenderId: '892102216572',
      appId: '1:892102216572:web:5a2b8ed301f02aabf4f2f9',
      storageBucket: 'gs://nyu-trade-2021.appspot.com'
    ),
  );
  runApp(MaterialApp(
    title: 'NYU Trade',
    home: MyApp(app: app),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.app}) : super(key: key);

  final FirebaseApp app;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        colorScheme: ColorScheme.light()
      ),
      home: LoginPage(),
    );
  }
}