import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

import 'package:zooppy/screens/homepage/Homescreen.dart';
import 'package:zooppy/screens/login/Login.dart';

Future main() async {
  await DotEnv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext contextP) {
    // Used to set Device Orientation
    // Here used Portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // Used to set Status Bar Color
    // Here used RedAccent color
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.red[700]));

    return MaterialApp(
      // debugShowCheckedModeBanner to false to disable Debug Banner
      debugShowCheckedModeBanner: false,

      // main.dart will execute first... The Class given in home "" will execute
      // home: CheckAuth(),
      home: CheckAuth(),
    );
  }
}

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
