import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zooppy/services/Auth.dart';

import 'package:zooppy/screens/register/verify_otp/VerifyOTP.dart';
import 'package:zooppy/screens/common_widgets/ZooppyLogo.dart';
import 'package:zooppy/screens/register/send_otp/OTPMobileTextField.dart';
import 'package:zooppy/screens/register/send_otp/SendOTPButton.dart';
import 'package:zooppy/screens/register/send_otp/AlreadyLoginButton.dart';

class SendOTP extends StatelessWidget {
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
        body: SendOTPFields(),
      ),
    );
  }
}

class SendOTPFields extends StatefulWidget {
  @override
  _SendOTPFieldsState createState() => _SendOTPFieldsState();
}

class _SendOTPFieldsState extends State<SendOTPFields> {
  var _mobileNumber;
  var _mobileController = TextEditingController();
  bool _sendOTPIsDisabled;

  @override
  void initState() {
    _sendOTPIsDisabled = true;
    super.initState();
  }

  //Function to return Snack Bar
  _showMsg(msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
      ),
    );
  }

  void _mobileNumberChanges(String value) {
    setState(() {
      if (value.length < 10) {
        _sendOTPIsDisabled = true;
      } else {
        _sendOTPIsDisabled = false;
      }
    });
    // print(value);
    // print(_loginButtonIsDisabled);
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
            OTPMobileTextField(
              mobileNumberController: _mobileController,
              mobileNumberChanges: _mobileNumberChanges,
            ),
            SizedBox(height: 20),
            SendOTPButton(
              sendOTPIsDisabled: _sendOTPIsDisabled,
              sendOTP: _sendOTP,
            ),
            SizedBox(height: 20),
            AlreadyLoginButton(),
          ],
        ),
      ),
    );
  }

  void _sendOTP() async {
    //Store _mobileController value to phonenumber variable
    _mobileNumber = _mobileController.text;
    // print(_mobileNumber);

    var type = "/register";
    //Call sendOtpRequest() function from AuthAPI Class

    var sendOtpApi = await AuthAPI().sendOtpRequest(_mobileNumber, type);

    //If request successfull
    if (sendOtpApi['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();

      //Saving 'mobile_number' in the shared preferences
      localStorage.setString('mobile_number', _mobileNumber);

      // // Checking mobile_number stored in Shared Preferences
      // var mobilenumbertoken = localStorage.getString('mobile_number');
      // print(mobilenumbertoken);

      // Navigate to VerifyOTP
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => VerifyOTP(),
        ),
      );
    } else {
      _showMsg(sendOtpApi['message']);
    }
  }
}
