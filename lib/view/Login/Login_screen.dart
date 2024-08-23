import 'package:flutter/material.dart';
import 'package:login_signup/view/Home_Screen/Home_Screen.dart';
import 'package:login_signup/view/Sign_up/signup_screen.dart';

// ignore: must_be_immutable
class Login_Screen extends StatefulWidget {
  String semail, spass;
  Login_Screen({super.key, required this.semail, required this.spass});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            height: 900,
            padding: EdgeInsets.all(42),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Sign in to Your Account",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your Email address';
                      }
                      if (!value.contains('@')) {
                        return 'Invalid Email address';
                      }
                      if (value != widget.semail) {
                        return 'Email does not match';
                      }
                      return null;
                    },
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      hintStyle:
                          TextStyle(fontSize: 15, color: Colors.grey.shade600),
                      hintText: "Your Email Address",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                    ),
                  ),
                  SizedBox(height: 22),
                  TextFormField(
                    validator: (value) {
                      if (passwordcontroller.text.length <= 5) {
                        return "Password must be at least 6 characters long";
                      }
                      if (value == null || value.isEmpty) {
                        return 'Enter your Password';
                      }
                      if (value != widget.spass) {
                        return 'Password does not match';
                      }
                      return null;
                    },
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.hide_source,
                        color: Colors.grey.shade600,
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      hintStyle:
                          TextStyle(fontSize: 15, color: Colors.grey.shade600),
                      hintText: "Your Password",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                    ),
                  ),
                  SizedBox(height: 22),
                  Row(
                    children: [
                      Icon(Icons.check_box_outlined),
                      Text("Remember Me"),
                      SizedBox(
                        width: 77,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text("Forgot Password"),
                        style: ButtonStyle(
                            foregroundColor:
                                WidgetStatePropertyAll(Colors.blue.shade600)),
                      )
                    ],
                  ),
                  SizedBox(height: 22),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                      }
                    },
                    child: Text("Sign in"),
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      minimumSize: WidgetStatePropertyAll(Size(500, 50)),
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.blue.shade700),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                  ),
                  SizedBox(height: 300),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Signup_screen(),
                              ));
                        },
                        child: Text(
                          "SignUp",
                          style: TextStyle(fontSize: 13),
                        ),
                        style: ButtonStyle(
                            foregroundColor:
                                WidgetStatePropertyAll(Colors.blue)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
