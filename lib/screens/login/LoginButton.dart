import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function login;
  final bool loginButtonIsDisabled;
  LoginButton({
    this.login,
    this.loginButtonIsDisabled,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loginButtonIsDisabled ? null : login,
      child: Container(
        decoration: BoxDecoration(
          color: loginButtonIsDisabled
              ? Colors.redAccent.withOpacity(0.5)
              : Colors.redAccent,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        child: Text(
          "Login",
          style: TextStyle(
            color: loginButtonIsDisabled
                ? Colors.white.withOpacity(0.5)
                : Colors.white,
          ),
        ),
      ),
    );
  }
}
