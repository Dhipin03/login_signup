import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_signup/controller/signup_screen_cvontroller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) async =>
        GoRouter.of(context).goNamed(
            await SignupScreenController.isLogin == true ||
                    await SignupScreenController.isLogout == false
                ? 'login'
                : 'homescreen'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Image.network(
                'https://img.freepik.com/free-vector/colorful-bird-illustration-gradient_343694-1741.jpg?w=1060&t=st=1729075252~exp=1729075852~hmac=27af0c9748ff8134f566d1239692c8ecade3da39e412faee605b3575580a7188'),
          ),
        ),
      ),
    );
  }
}
