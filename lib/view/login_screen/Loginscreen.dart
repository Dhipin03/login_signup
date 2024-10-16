import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_signup/controller/signup_screen_cvontroller.dart';

class Loginscreen extends StatefulWidget {
  Loginscreen({
    super.key,
  });

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool val = true;
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
                      } else if (value != SignupScreenController.email) {
                        return "Invalid email";
                      } else {
                        return null;
                      }
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
                    obscureText: val,
                    validator: (value) {
                      if (passwordcontroller.text.length <= 5) {
                        return "Password must be at least 6 characters long";
                      }
                      if (value == null || value.isEmpty) {
                        return 'Enter your Password';
                      }
                      if (value != SignupScreenController.password) {
                        return 'Password does not match';
                      }
                      return null;
                    },
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              val = !val;
                            });
                          },
                          child: Icon(
                              !val ? Icons.visibility : Icons.visibility_off)),
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
                      SignupScreenController.getUser();
                      setState(() {});
                      if (_formKey.currentState!.validate()) {
                        GoRouter.of(context).pushNamed('homescreen');
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
                          GoRouter.of(context).pushNamed('signup');
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
