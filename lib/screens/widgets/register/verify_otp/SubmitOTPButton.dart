import 'package:flutter/material.dart';

class SubmitOTPButton extends StatelessWidget {
  final otpController;
  final Function submitOTP;
  SubmitOTPButton({this.otpController, this.submitOTP});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          primary: Colors.red,
          padding: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
          textStyle: TextStyle(color: Colors.white),
        ),
        child: Text(
          "Submit OTP",
          style: TextStyle(
              // fontSize: 20,
              ),
        ),
        onPressed: submitOTP,

        // splashColor: Colors.grey,
      ),
    );
  }
}
