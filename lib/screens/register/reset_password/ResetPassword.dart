import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zooppy/services/Auth.dart';
import 'package:zooppy/screens/common_widgets/ZooppyLogo.dart';
import 'package:zooppy/screens/homepage/Homescreen.dart';
import 'package:zooppy/screens/register/reset_password/ResetPasswordButton.dart';
import 'package:zooppy/screens/register/reset_password/ResetPasswordTextField.dart';
import 'package:zooppy/screens/register/send_otp/AlreadyLoginButton.dart';

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          //Used to Blend Image With Opacity
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
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.redAccent,
          elevation: 20,
          title: Text(
            "Reset Password",
            style: TextStyle(
                // fontSize: 25,
                ),
          ),
        ),
        body: ResetPasswordFields(),
      ),
    );
  }
}

class ResetPasswordFields extends StatefulWidget {
  @override
  _ResetPasswordFieldsState createState() => _ResetPasswordFieldsState();
}

class _ResetPasswordFieldsState extends State<ResetPasswordFields> {
  var _newPassword;
  var _resetPasswordController = TextEditingController();
  bool _resetPasswordNotVisible;

  @override
  void initState() {
    _resetPasswordNotVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 70),
            ZooppyLogo(),
            SizedBox(height: 50),
            ResetPasswordTextField(
              resetPasswordController: _resetPasswordController,
              resetPasswordNotVisible: _resetPasswordNotVisible,
            ),
            SizedBox(height: 20),
            ResetPasswordButton(resetPassword: _resetPassword),
            SizedBox(height: 1),
            AlreadyLoginButton(),
          ],
        ),
      ),
    );
  }

  void _resetPassword() async {
    _newPassword = _resetPasswordController.text;
    // print(_newPassword);

    var resetPasswordApi;
    var loginApi;

    SharedPreferences localStorage = await SharedPreferences.getInstance();

    //Fetching Mobile Number from Shared Preferences
    var mobileNumberToken = localStorage.getString('mobile_number');

    //Fetching OTP from Shared Preferences
    var otpToken = localStorage.getString('otp');

    if (_newPassword.toString().isEmpty ||
        _newPassword.toString().length <= 5) {
      // print(_newPassword);
      print("Enter New Password");
    } else {
      resetPasswordApi = await AuthAPI()
          .resetPasswordRequest(mobileNumberToken, otpToken, _newPassword);
      if (resetPasswordApi['success']) {
        //Call Login API
        loginApi = await AuthAPI()
            .loginRequest('+91' + mobileNumberToken, _newPassword);
        //mobileNumberToken : Value from Shared Preferences
        //_newpassword : Value from Password Text Field

        //If request successfull
        if (loginApi['success']) {
          SharedPreferences localStorage =
              await SharedPreferences.getInstance();
          //Saving body['acces_token'] to the key 'access_token in the shared preferences
          //Saving body['user_id'] to the key 'user_id in the shared preferences
          localStorage.setString(
              'access_token', json.encode(loginApi['access_token']));
          localStorage.setString('user_id', json.encode(loginApi['user_id']));
          //Navigate to Home Page
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen(),
            ),
          );
        }
      }
    }
  }
}
