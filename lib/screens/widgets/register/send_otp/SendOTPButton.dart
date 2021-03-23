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
    return GestureDetector(
      onTap: sendOTPIsDisabled ? null : sendOTP,
      child: Container(
        decoration: BoxDecoration(
          color: sendOTPIsDisabled
              ? Colors.redAccent.withOpacity(0.5)
              : Colors.redAccent,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
        child: Text(
          "Send OTP",
          style: TextStyle(
            color: sendOTPIsDisabled
                ? Colors.white.withOpacity(0.5)
                : Colors.white,
          ),
        ),
      ),
    );
  }
}
