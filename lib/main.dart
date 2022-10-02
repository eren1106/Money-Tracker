import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/in_app.dart';
import 'package:money_tracker/screens/login_screen.dart';
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
      home: StreamBuilder( //use streambuilder to keep checking whether got user or not
        stream: FirebaseAuth.instance.authStateChanges(), //when auth change (login or logout), it will go through here
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.active){
            if(snapshot.hasData){
              return InApp();
            }
            else if(snapshot.hasError){
              return Center(
                child: Text('${snapshot.error}'), //show error text when got error
              );
            }
          }
          if(snapshot.connectionState == ConnectionState.waiting){ //show loading
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return LoginScreen(); //show login when no user
        },
      ),
    );
  }
}