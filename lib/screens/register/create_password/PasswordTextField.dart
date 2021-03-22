import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final passwordController;
  PasswordTextField({this.passwordController});
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
        controller: passwordController,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          fillColor: Colors.black,
          hintText: "Create a Password",
        ),
      ),
    );
  }
}
