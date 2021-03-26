import 'package:flutter/material.dart';

class ResendOTPButton extends StatelessWidget {
  final Function resendOTP;
  ResendOTPButton({
    this.resendOTP,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.orange,
      ),
      child: Text(
        'Resend OTP',
        style: TextStyle(
            // fontSize: 20.0,
            ),
      ),
      onPressed: resendOTP,
    );
  }
}
