import 'package:flutter/material.dart';

class MyDreamPriceButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(8.0),
            primary: Colors.red,
            textStyle: TextStyle(
              color: Colors.white,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5),
              side: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),

          // splashColor: Colors.grey,
          child: Text(
            "My Dream Prices",
            style: TextStyle(
                // fontSize: 15,
                ),
          ),
          onPressed: () {
            print("My Dream Prices Clicked");
          },
        ),
      ),
    );
  }
}
