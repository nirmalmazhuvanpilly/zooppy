import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:zooppy/services/auth.dart';

import 'package:zooppy/screens/main_screens/Homescreen.dart';
import 'package:zooppy/screens/widgets/login/LoginButton.dart';
import 'package:zooppy/screens/widgets/login/LoginPasswordTextField.dart';
import 'package:zooppy/screens/widgets/login/LoginMobileTextField.dart';
import 'package:zooppy/screens/widgets/login/ForgotPasswordButton.dart';
import 'package:zooppy/screens/widgets/common_widgets/ZooppyLogo.dart';
import 'package:zooppy/screens/widgets/login/SignUpButton.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.2),
            BlendMode.dstATop,
          ),
          fit: BoxFit.cover,
          image: AssetImage('assets/bg.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: LoginFields(),
      ),
    );
  }
}

class LoginFields extends StatefulWidget {
  @override
  _LoginFieldsState createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  var _mobileNumber;
  var _password;
  // _mobileNumberController = Controller for the TextField Mobile Number
  // _passwordController = Controller for the TextField Password
  var _mobileNumberController = TextEditingController();
  var _passwordController = TextEditingController();
  bool _passwordNotVisible;
  bool _loginButtonIsDisabled;

  //Function to return Snack Bar
  _showMsg(msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
      ),
    );
  }

  @override
  void initState() {
    _passwordNotVisible = true;
    _loginButtonIsDisabled = true;
    super.initState();
  }

  // Login Button Validation
  // Enabled when Mobile Number reaches 10 Digit
  void _mobileNumberChanges(String value) {
    setState(() {
      if (value.length < 10) {
        _loginButtonIsDisabled = true;
      } else {
        _loginButtonIsDisabled = false;
      }
    });
    // print(value);
    // print(_loginButtonIsDisabled);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 100),
          ZooppyLogo(),
          SizedBox(height: 50),
          LoginMobileTextField(
            mobileNumberController: _mobileNumberController,
            mobileNumberChanges: _mobileNumberChanges,
          ),
          SizedBox(height: 20),
          LoginPasswordTextField(
            passwordController: _passwordController,
            passwordNotVisible: _passwordNotVisible,
          ),
          SizedBox(height: 20),
          LoginButton(
            loginButtonIsDisabled: _loginButtonIsDisabled,
            login: _login,
          ),
          ForgotPasswordButton(),
          SignUpButton(),
        ],
      ),
    );
  }

  void _login() async {
    //Store _mobileNumberController & _passwordController value to _mobileNumber & _password variables
    _mobileNumber = "+91" + _mobileNumberController.text;
    _password = _passwordController.text;
    // print(_mobileNumber);
    // print(_password);

    var logInApi;

    if (_password.toString().isEmpty) {
      print("Enter Valid Password");
    } else {
      //Call loginRequest() function from AuthAPI Class
      logInApi = await AuthAPI().loginRequest(_mobileNumber, _password);

      //If request successfull
      if (logInApi['success']) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();

        //Saving 'access_token in the shared preferences
        localStorage.setString(
            'access_token', json.encode(logInApi['access_token']));

        //Saving 'user_id in the shared preferences
        localStorage.setString('user_id', json.encode(logInApi['user_id']));

        //Navigate to Home Page
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen(),
          ),
        );
      } else {
        _showMsg(logInApi['message']);
      }
    }
  }
}
