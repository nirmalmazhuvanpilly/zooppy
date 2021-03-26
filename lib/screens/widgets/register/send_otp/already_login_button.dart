import 'package:flutter/material.dart';
import 'package:zooppy/screens/main_screens/login.dart';

class AlreadyLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Already having account ?",
          style: TextStyle(
            color: Colors.white,
            // fontSize: 20,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(primary: Colors.redAccent),
          child: Text(
            'LogIn',
            style: TextStyle(
                // fontSize: 20.0,
                ),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => Login(),
              ),
            );
          },
        ),
      ],
    );
  }
}
