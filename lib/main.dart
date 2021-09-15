import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gst_app/src/ui/homescreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
            bodyText1: TextStyle(fontSize: 16.0, color: Colors.white),
            bodyText2: TextStyle(fontSize: 16.0, color: Colors.black),
            subtitle1: TextStyle(
              fontSize: 14,
              color: Color(0xff2DA05E),
            )),
      ),
      home: SafeArea(child: HomeScreen()),
    );
  }
}
