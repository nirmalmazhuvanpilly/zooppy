import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zooppy/services/auth.dart';

import 'package:zooppy/screens/widgets/common_widgets/zooppy_logo.dart';
import 'package:zooppy/screens/main_screens/reset_password_otp.dart';
import 'package:zooppy/screens/widgets/register/send_otp/already_login_button.dart';
import 'package:zooppy/screens/widgets/register/send_otp/otp_mobile_text_field.dart';
import 'package:zooppy/screens/widgets/register/send_otp/send_otp_button.dart';

class ResetSendOTP extends StatelessWidget {
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
            "Reset Password",
            style: TextStyle(
                // fontSize: 25,
                ),
          ),
        ),
        body: ResetSendOTPFields(),
      ),
    );
  }
}

class ResetSendOTPFields extends StatefulWidget {
  @override
  _ResetSendOTPFieldsState createState() => _ResetSendOTPFieldsState();
}

class _ResetSendOTPFieldsState extends State<ResetSendOTPFields> {
  var _mobileNumber;
  var _resetMobileController = TextEditingController();
  bool _resetSendOTPIsDisabled;

  @override
  void initState() {
    _resetSendOTPIsDisabled = true;
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

  void _resetMobileNumberChanges(String value) {
    setState(() {
      if (value.length < 10) {
        _resetSendOTPIsDisabled = true;
      } else {
        _resetSendOTPIsDisabled = false;
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
              mobileNumberChanges: _resetMobileNumberChanges,
              mobileNumberController: _resetMobileController,
            ),
            SizedBox(height: 20),
            SendOTPButton(
              sendOTP: resetSendOTP,
              sendOTPIsDisabled: _resetSendOTPIsDisabled,
            ),
            SizedBox(height: 20),
            AlreadyLoginButton(),
          ],
        ),
      ),
    );
  }

  void resetSendOTP() async {
    _mobileNumber = _resetMobileController.text;
    // print(_mobileNumber);

    var type = "/reset_password";

    //Call resetSendOtpRequest() function from AuthAPI Class
    var sendOtpApi = await AuthAPI().sendOtpRequest(_mobileNumber, type);

    //If request successfull
    if (sendOtpApi['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();

      //Saving 'mobile_number' in the shared preferences
      localStorage.setString('mobile_number', _mobileNumber);

      // // ignore: unused_local_variable
      // // Checking mobile_number stored in Shared Preferences
      // var mobilenumbertoken = localStorage.getString('mobile_number');
      // print(mobilenumbertoken);

      // Navigate to RegisterOTP
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => ResetPasswordOTP(),
        ),
      );
      // print("OTP Sent");
    } else {
      _showMsg(sendOtpApi['message']);
    }
  }
}
