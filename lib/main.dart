import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/pages/caht-page.dart';
import 'package:chatapp/pages/login.dart';
import 'package:chatapp/pages/regsiter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
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
    return  MaterialApp(
      routes:{
        'LoginPage' :(context) =>  Login(),
        RegsiterPage.id:(context) => RegsiterPage(),
        ChatPage.id:(context) => ChatPage(),

      },
      initialRoute:'LoginPage',
      debugShowCheckedModeBanner: false,
    );
  }

}