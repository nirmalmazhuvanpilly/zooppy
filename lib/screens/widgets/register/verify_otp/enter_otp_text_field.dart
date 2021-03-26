import 'package:flutter/material.dart';

class EnterOTPTextField extends StatelessWidget {
  final otpController;
  EnterOTPTextField({this.otpController});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Colors.white,
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: otpController,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          fillColor: Colors.black,
          hintText: "Enter OTP",
        ),
      ),
    );
  }
}
