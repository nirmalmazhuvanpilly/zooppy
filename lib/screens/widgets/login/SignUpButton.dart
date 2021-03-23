import 'package:flutter/material.dart';
import 'package:zooppy/screens/main_screens/SendOTP.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "No account yet ?",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        TextButton(
          child: Text(
            'Sign Up',
          ),
          style: TextButton.styleFrom(primary: Colors.redAccent),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => SendOTP(),
              ),
            );
          },
        ),
      ],
    );
  }
}
