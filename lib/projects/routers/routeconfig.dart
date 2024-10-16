import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_signup/view/home_Screen/homescreen.dart';
import 'package:login_signup/view/login_screen/Loginscreen.dart';
import 'package:login_signup/view/signup_screen/signupscreen.dart';
import 'package:login_signup/view/splash_screen/splash_screen.dart';

class MyApprouteconfig {
  GoRouter router1 = GoRouter(routes: [
    GoRoute(
      path: '/login',
      name: 'login',
      pageBuilder: (context, state) {
        return MaterialPage(child: Loginscreen());
      },
    ),
    GoRoute(
      path: '/signup',
      name: 'signup',
      pageBuilder: (context, state) {
        return MaterialPage(child: Signupscreen());
      },
    ),
    GoRoute(
      path: '/homescreen',
      name: 'homescreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: HomeScreen());
      },
    ),
    GoRoute(
      path: '/',
      name: 'splashscreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: SplashScreen());
      },
    ),
  ], initialLocation: '/');
}
