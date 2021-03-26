import 'package:flutter/material.dart';
import 'package:zooppy/screens/main_screens/reset_send_otp.dart';

class ForgotPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        'Forgot Password ?',
      ),
      style: TextButton.styleFrom(primary: Colors.orange),
      onPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => ResetSendOTP(),
          ),
        );
      },
    );
  }
}
