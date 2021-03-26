import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:zooppy/services/auth.dart';

import 'package:zooppy/screens/widgets/common_widgets/ZooppyLogo.dart';
import 'package:zooppy/screens/widgets/register/verify_otp/EnterOTPTextField.dart';
import 'package:zooppy/screens/widgets/register/verify_otp/ResendOTPButton.dart';
import 'package:zooppy/screens/widgets/register/verify_otp/SubmitOTPButton.dart';
import 'package:zooppy/screens/main_screens/CreatePassword.dart';
import 'package:zooppy/screens/widgets/register/send_otp/AlreadyLoginButton.dart';

class VerifyOTP extends StatelessWidget {
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
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.redAccent,
          elevation: 20,
          title: Text(
            "Register",
            style: TextStyle(
                // fontSize: 25,
                ),
          ),
        ),
        body: VerifyOTPFields(),
      ),
    );
  }
}

class VerifyOTPFields extends StatefulWidget {
  @override
  _VerifyOTPFieldsState createState() => _VerifyOTPFieldsState();
}

class _VerifyOTPFieldsState extends State<VerifyOTPFields> {
  var _otpController = TextEditingController();

  var _otp;

  //Function to return Snack Bar
  _showMsg(msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
      ),
    );
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
            EnterOTPTextField(
              otpController: _otpController,
            ),
            SizedBox(height: 20),
            SubmitOTPButton(
              otpController: _otpController,
              submitOTP: _submitOTP,
            ),
            SizedBox(height: 1),
            ResendOTPButton(resendOTP: _resendOTP),
            AlreadyLoginButton(),
          ],
        ),
      ),
    );
  }

  void _submitOTP() async {
    //Store _otpController value to otp variable
    _otp = _otpController.text;
    // print(_otp);

    if (_otp.isEmpty) {
      _otp = "0";
    }

    //Fetching Mobile Number from Shared Preferences
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var mobilenumbertoken = localStorage.getString('mobile_number').toString();
    // print(mobilenumbertoken);

    //Call submitOtpRequest() function from AuthAPI Class
    var verifyOtpApi =
        await AuthAPI().submitOtpRequest(mobilenumbertoken, _otp);

    //If Request successful
    if (verifyOtpApi['success']) {
      //Saving _otp value from _otpController to the key 'otp' in the shared preferences
      localStorage.setString('otp', _otp);

      // Navigate to CreatePassword
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => CreatePassword(),
        ),
      );
    } else {
      _showMsg(verifyOtpApi['message']);
    }
  }

  void _resendOTP() async {
    //Fetching Mobile Number from Shared Preferences
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var mobilenumbertoken = localStorage.getString('mobile_number');
    // print(mobilenumbertoken);

    //Call resendOtpRequest() function from AuthAPI Class
    var resendOtpApi = await AuthAPI().resendOtpRequest(mobilenumbertoken);

    if (resendOtpApi['success']) {
      _showMsg(resendOtpApi['message']);
    }
  }
}
