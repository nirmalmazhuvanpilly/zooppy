import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zooppy/services/Auth.dart';

import 'package:zooppy/screens/widgets/common_widgets/ZooppyLogo.dart';
import 'package:zooppy/screens/main_screens/Homescreen.dart';
import 'package:zooppy/screens/widgets/register/create_password/ClickHere.dart';
import 'package:zooppy/screens/widgets/register/create_password/PasswordTextField.dart';
import 'package:zooppy/screens/widgets/register/create_password/RefCodeTextField.dart';
import 'package:zooppy/screens/widgets/register/create_password/RegisterButton.dart';
import 'package:zooppy/screens/widgets/register/create_password/TnC.dart';
import 'package:zooppy/screens/widgets/register/send_otp/AlreadyLoginButton.dart';

class CreatePassword extends StatelessWidget {
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
        body: CreatePasswordFields(),
      ),
    );
  }
}

class CreatePasswordFields extends StatefulWidget {
  @override
  _CreatePasswordFieldsState createState() => _CreatePasswordFieldsState();
}

class _CreatePasswordFieldsState extends State<CreatePasswordFields> {
  var _password;
  var _refCode;
  var _passwordController = TextEditingController();
  var _refCodeController = TextEditingController();
  bool _clickhereEnabled;

  @override
  void initState() {
    _clickhereEnabled = false;
    // print(_clickhereEnabled);
    super.initState();
  }

  _enabledState() {
    setState(() {
      _clickhereEnabled = true;
    });
    // print(_clickhereEnabled);
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
            SizedBox(height: 20),

            //Conditional Ternary Operator
            _clickhereEnabled
                ? Container()
                : ClickHere(
                    enabledState: _enabledState,
                  ),

            //Conditional Ternary Operator
            _clickhereEnabled
                ? RefCodeTextField(
                    refCodeController: _refCodeController,
                  )
                : Container(),

            SizedBox(height: 10),
            PasswordTextField(
              passwordController: _passwordController,
            ),

            SizedBox(height: 20),
            RegisterButton(
              register: _register,
            ),

            SizedBox(height: 1),
            TnC(),
            AlreadyLoginButton(),
          ],
        ),
      ),
    );
  }

  void _register() async {
    //Store _passwordController & _refCodeController value to _password & _refCode variables
    _password = _passwordController.text;
    _refCode = _refCodeController.text;
    // print(_password);
    // print(_refcode);

    SharedPreferences localStorage = await SharedPreferences.getInstance();

    //Fetching Mobile Number from Shared Preferences
    var mobileNumberToken = localStorage.getString('mobile_number');
    // print(mobilenumbertoken);

    //Fetching OTP from Shared Preferences
    var otpToken = localStorage.getString('otp');
    // print(otptoken);

    var data;
    if (_refCode.toString().isEmpty && _password.toString().isEmpty) {
      // ignore: unnecessary_statements
      data;
    } else if (_refCode.toString().isEmpty && _password.toString().isNotEmpty) {
      data = {'password': _password};
    } else if (_refCode.toString().isNotEmpty &&
        _password.toString().isNotEmpty) {
      data = {'password': _password, 'referral_code': _refCode};
      //password = API request body Key Value
      //referral_code = API request body Key value
    }
    // print('Body:$data');

    if (data == null) {
      print("Enter Password");
    } else {
      //Call registerRequest() function from AuthAPI Class and assignd to variable
      var registerApi =
          await AuthAPI().registerRequest(mobileNumberToken, otpToken, data);

      //If request successful
      if (registerApi['success']) {
        //Call Login API
        var loginApi =
            await AuthAPI().loginRequest("+91" + mobileNumberToken, _password);
        //mobilenumbertoken : Value from shared preferences
        //_password : value from _password

        //If Request Successful
        if (loginApi['success']) {
          SharedPreferences localStorage =
              await SharedPreferences.getInstance();
          //Saving body['acces_token'] to the key 'access_token' in the shared preferences
          //Saving body['user_id'] to the key 'user_id' in the shared preferences
          localStorage.setString(
              'access_token', json.encode(loginApi['access_token']));
          localStorage.setString('user_id', json.encode(loginApi['user_id']));

          //Saving boolean value true to the key 'new user' in the shared preferences
          localStorage.setBool('new_user', true);

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
