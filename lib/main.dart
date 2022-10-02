import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/in_app.dart';
import 'package:money_tracker/theme/app_theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //must have this in main.dart to use firebase
  await Firebase.initializeApp(); //must have this in main.dart to use firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      home: InApp(),
    );
  }
}