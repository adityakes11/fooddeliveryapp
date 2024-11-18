import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test/admin/admin_login.dart';
import 'package:test/admin/home_admin.dart';
import 'package:test/pages/bottomnav.dart';
import 'package:test/pages/onboard.dart';

import 'firebase_options.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onboard(),
    );
  }
}