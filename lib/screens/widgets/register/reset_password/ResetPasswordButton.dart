import 'package:flutter/material.dart';

class ResetPasswordButton extends StatelessWidget {
  final Function resetPassword;
  ResetPasswordButton({
    this.resetPassword,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          primary: Colors.red,
          textStyle: TextStyle(color: Colors.white),
        ),
        child: Text(
          "Reset Password",
          style: TextStyle(
              // fontSize: 20,
              ),
        ),
        onPressed: resetPassword,

        // splashColor: Colors.grey,
      ),
    );
  }
}
