import 'package:flutter/material.dart';

class SendOTPButton extends StatelessWidget {
  final bool sendOTPIsDisabled;
  final Function sendOTP;
  SendOTPButton({
    this.sendOTPIsDisabled,
    this.sendOTP,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            primary: Colors.red,
            textStyle: TextStyle(color: Colors.white)),
        child: Text(
          "Send OTP",
          style: TextStyle(
              // fontSize: 20,
              ),
        ),
        onPressed: sendOTPIsDisabled ? null : sendOTP,

        // disabledColor: Colors.redAccent.withOpacity(0.8),
        // disabledTextColor: Colors.white.withOpacity(0.4),

        // splashColor: Colors.grey,
      ),
    );
  }
}
