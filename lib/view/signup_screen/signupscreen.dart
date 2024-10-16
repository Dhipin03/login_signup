import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_signup/controller/signup_screen_cvontroller.dart';

import 'package:login_signup/view/login_screen/Loginscreen.dart';

class Signupscreen extends StatefulWidget {
  Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  bool val = true;
  bool val1 = true;

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await SignupScreenController.initsharedpreferences();
      },
    );
    super.initState();
  }

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
                    "Sign up for Free",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  TextFormField(
                    validator: (value) {
                      final RegExp emailRegExp = RegExp(
                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                      if (value == null || value.isEmpty) {
                        return 'Enter your Email address';
                      }
                      if (emailRegExp.hasMatch(value)) {
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
                    obscureText: val1,
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
                        onTap: () {
                          setState(() {
                            val1 = !val1;
                          });
                        },
                        child: Icon(
                          size: 22,
                          color: Colors.grey.shade500,
                          !val1 ? Icons.visibility : Icons.visibility_off,
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
                    obscureText: val,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the password';
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
                        onTap: () {
                          setState(() {
                            val = !val;
                          });
                        },
                        child: Icon(
                            size: 22,
                            color: Colors.grey.shade500,
                            !val ? Icons.visibility : Icons.visibility_off),
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
                    onPressed: () async {
                      await SignupScreenController.addUser(
                          emailcontroller.text, passwordcontroller.text);
                      if (_formKey.currentState!.validate()) {
                        GoRouter.of(context).pushNamed('login');
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
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loginscreen(),
                              ));
                        },
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
