import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zooppy/screens/main_screens/Homescreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        ),
      ),
    );
    //Navigates to HomeScreen from SplashScreen after 3 Seconds
    //Import homescreen.dart to access HomeScreen Class
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 200,
          height: 100,
          child: Image.asset(
            'assets/zooppy.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
