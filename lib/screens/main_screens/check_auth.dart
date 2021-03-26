import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zooppy/screens/main_screens/homescreen.dart';
import 'package:zooppy/screens/main_screens/login.dart';

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  // Function for checking LoggedIn or Not
  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    // store sharedpreferences value from 'access_token' key to variable token
    var token = localStorage.getString('access_token');

    // If token has value from shared preferences set isAuth to True
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = HomeScreen();
    } else {
      child = Login();
    }
    return child;
  }
}
