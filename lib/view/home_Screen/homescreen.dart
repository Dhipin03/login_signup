import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_signup/controller/signup_screen_cvontroller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "HomeScreen",
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            ElevatedButton(
                onPressed: () async {
                  await SignupScreenController.logout();
                  GoRouter.of(context).goNamed('login');
                },
                child: Text('logout'))
          ],
        ),
      ),
    );
  }
}
