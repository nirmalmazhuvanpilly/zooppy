import 'package:flutter/material.dart';

class ClickHere extends StatelessWidget {
  final Function enabledState;

  ClickHere({
    this.enabledState,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "Have a referral code?",
          style: TextStyle(
            color: Colors.orange,
            // fontSize: 20,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(primary: Colors.orange),
          child: Text(
            'Click here',
            style: TextStyle(
                // fontSize: 20.0,
                ),
          ),
          onPressed: enabledState,
        ),
      ],
    );
  }
}
