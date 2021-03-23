import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPasswordTextField extends StatefulWidget {
  final passwordController;
  bool passwordNotVisible;

  LoginPasswordTextField({this.passwordController, this.passwordNotVisible});

  @override
  _LoginPasswordTextFieldState createState() => _LoginPasswordTextFieldState();
}

class _LoginPasswordTextFieldState extends State<LoginPasswordTextField> {
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
        controller: widget.passwordController,
        obscureText: widget.passwordNotVisible,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            color: Colors.black,
            icon: Icon(Icons.visibility),
            onPressed: () {
              setState(() {
                widget.passwordNotVisible = !widget.passwordNotVisible;
              });
            },
          ),
          contentPadding: EdgeInsets.fromLTRB(70, 15, 30, 15),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          fillColor: Colors.black,
          hintText: "Password",
        ),
      ),
    );
  }
}
