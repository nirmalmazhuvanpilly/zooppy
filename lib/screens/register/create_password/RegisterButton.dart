import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final Function register;
  RegisterButton({
    this.register,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(8.0),
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
      ),
    );
  }
}
