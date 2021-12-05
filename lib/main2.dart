import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nyutrade1/Pages/authenticate.dart';

import 'firebase_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(Nyutrade());
}

class Nyutrade extends StatelessWidget {
  Nyutrade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NYUTRADE',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Authenticate(),
    );
  }
}
