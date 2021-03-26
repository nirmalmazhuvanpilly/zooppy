import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final Function register;
  RegisterButton({
    this.register,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
        primary: Colors.red,
        textStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      child: Text(
        "Register",
        style: TextStyle(
            // fontSize: 20,
            ),
      ),
      onPressed: register,

      // splashColor: Colors.grey,
    );
  }
}
