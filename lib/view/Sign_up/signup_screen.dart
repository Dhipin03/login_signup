import 'package:flutter/material.dart';
import 'package:login_signup/view/Login/Login_screen.dart';

class Signup_screen extends StatefulWidget {
  Signup_screen({super.key});

  @override
  State<Signup_screen> createState() => _Signup_screenState();
}

class _Signup_screenState extends State<Signup_screen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  bool val = false;
  bool val1 = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
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
                    "Sign up for Free",
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
                      if (emailcontroller.text.contains('@')) {
                        return null;
                      }
                      return "Invalid Email address";
                    },
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
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
                    ),
                  ),
                  SizedBox(height: 22),
                  TextFormField(
                    obscureText: val,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your Password';
                      }
                      if (passwordcontroller.text.length >= 6) {
                        return null;
                      }
                      return "Password must be at least 6 characters long";
                    },
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      suffixIcon: InkWell(
                        onDoubleTap: () {
                          setState(() {
                            val = false;
                          });
                        },
                        onTap: () {
                          setState(() {
                            val = true;
                          });
                        },
                        child: Icon(
                          Icons.hide_source,
                          size: 22,
                          color: Colors.grey.shade500,
                        ),
                      ),
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
                  TextFormField(
                    obscureText: val1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm your Password';
                      }
                      if (value != passwordcontroller.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    controller: confirmpasswordcontroller,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      suffixIcon: InkWell(
                        onDoubleTap: () {
                          setState(() {
                            val1 = false;
                          });
                        },
                        onTap: () {
                          setState(() {
                            val1 = true;
                          });
                        },
                        child: Icon(
                          Icons.hide_source,
                          size: 22,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      hintStyle:
                          TextStyle(fontSize: 15, color: Colors.grey.shade600),
                      hintText: "Confirm Password",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                    ),
                  ),
                  SizedBox(height: 22),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login_Screen(
                                      semail: emailcontroller.text,
                                      spass: passwordcontroller.text,
                                    )));
                      }
                    },
                    child: Text("Sign Up"),
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
                        onPressed: () {},
                        child: Text(
                          "Sign In",
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
