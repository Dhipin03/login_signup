import 'package:shared_preferences/shared_preferences.dart';

class SignupScreenController {
  static late final SharedPreferences prefs;
  static String? email;
  static String? password;
  static bool isLogin = false;
  static bool isLogout = false;
  static Future initsharedpreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future addUser(String email, String password) async {
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    isLogin = true;
  }

  static logout() {
    isLogout = true;
  }

  static getUser() {
    email = prefs.getString('email');
    password = prefs.getString('password');
  }
}
