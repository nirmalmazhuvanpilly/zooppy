import 'package:flutter/material.dart';

class TnC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "By registering, I agree to Zooppy's",
          style: TextStyle(
            color: Colors.white,
            // fontSize: 20,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            primary: Colors.redAccent,
          ),
          child: Text(
            'T&Cs',
            style: TextStyle(
                // fontSize: 20.0,
                ),
          ),
          onPressed: () {
            print("T&Cs Clicked");
          },
        ),
      ],
    );
  }
}
