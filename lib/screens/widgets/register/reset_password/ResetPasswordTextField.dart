import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResetPasswordTextField extends StatefulWidget {
  final resetPasswordController;
  bool resetPasswordNotVisible;
  ResetPasswordTextField({
    this.resetPasswordController,
    this.resetPasswordNotVisible,
  });
  @override
  _ResetPasswordTextFieldState createState() => _ResetPasswordTextFieldState();
}

class _ResetPasswordTextFieldState extends State<ResetPasswordTextField> {
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
        controller: widget.resetPasswordController,
        obscureText: widget.resetPasswordNotVisible,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            color: Colors.black,
            icon: Icon(Icons.visibility),
            onPressed: () {
              setState(() {
                widget.resetPasswordNotVisible =
                    !widget.resetPasswordNotVisible;
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
          hintText: "Enter New Password",
        ),
      ),
    );
  }
}
