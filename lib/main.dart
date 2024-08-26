import 'package:flutter/material.dart';
import 'package:login_signup/view/login_screen/Loginscreen.dart';

String? regpass;
String? regemail;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loginscreen(),
    );
  }
}
