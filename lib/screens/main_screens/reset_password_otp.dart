import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zooppy/services/auth.dart';
import 'package:zooppy/screens/widgets/common_widgets/zooppy_logo.dart';
import 'package:zooppy/screens/main_screens/reset_password.dart';
import 'package:zooppy/screens/widgets/register/send_otp/already_login_button.dart';
import 'package:zooppy/screens/widgets/register/verify_otp/enter_otp_text_field.dart';
import 'package:zooppy/screens/widgets/register/verify_otp/resend_otp_button.dart';
import 'package:zooppy/screens/widgets/register/verify_otp/submit_otp_button.dart';

class ResetPasswordOTP extends StatelessWidget {
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

          //From Network
          // image: NetworkImage("https://floridapolitics.com/wp-content/uploads/2016/01/film-production.jpg"),

          //From Assets
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
        body: ResetPasswordOTPFields(),
      ),
    );
  }
}

class ResetPasswordOTPFields extends StatefulWidget {
  @override
  _ResetPasswordOTPFieldsState createState() => _ResetPasswordOTPFieldsState();
}

class _ResetPasswordOTPFieldsState extends State<ResetPasswordOTPFields> {
  var _resetOtpController = TextEditingController();
  var _resetOtp;

  // Function to return Snack Bar
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
              otpController: _resetOtpController,
            ),
            SizedBox(height: 20),
            SubmitOTPButton(
              otpController: _resetOtpController,
              submitOTP: _resetSubmitOTP,
            ),
            SizedBox(height: 1),
            ResendOTPButton(resendOTP: _resetResendOTP),
            AlreadyLoginButton(),
          ],
        ),
      ),
    );
  }

  void _resetSubmitOTP() async {
    //Store _resetOtpController value to resetOtp variable
    _resetOtp = _resetOtpController.text;
    // print(_resetOtp);

    if (_resetOtp.toString().isEmpty) {
      _resetOtp = "0";
      // print(_resetOtp);
    }

    //Fetching Mobile Number from Shared Preferences
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var mobilenumbertoken = localStorage.getString('mobile_number').toString();
    // print(mobilenumbertoken);

    //Call submitOtpRequest() function from AuthAPI Class
    var verifyOtpApi =
        await AuthAPI().submitOtpRequest(mobilenumbertoken, _resetOtp);

    //If Request successfull
    if (verifyOtpApi['success']) {
      //Saving _otp value from otp controller to the key 'otp' in the shared preferences
      localStorage.setString('otp', _resetOtp);

      // Navigate to CreatePassword
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => ResetPassword(),
        ),
      );
    } else {
      _showMsg(verifyOtpApi['message']);
    }
  }

  void _resetResendOTP() async {
    //Fetching Mobile Number from Shared Preferences
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var mobilenumbertoken = localStorage.getString('mobile_number');
    // print(mobilenumbertoken);

    //Call resendOtpRequest() function from AuthAPI Class
    var resendOtpApi = await AuthAPI().resetResendOtpRequest(mobilenumbertoken);

    //If Request successfull
    if (resendOtpApi['success']) {
      _showMsg(resendOtpApi['message']);
    }
  }
}
