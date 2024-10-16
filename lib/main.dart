import 'package:flutter/material.dart';
import 'package:login_signup/controller/signup_screen_cvontroller.dart';

import 'package:login_signup/projects/routers/routeconfig.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SignupScreenController.initsharedpreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routerconfig = MyApprouteconfig().router1;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: routerconfig.routeInformationParser,
      routerDelegate: routerconfig.routerDelegate,
      routeInformationProvider: routerconfig.routeInformationProvider,
    );
  }
}
