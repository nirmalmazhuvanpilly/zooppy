import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginMobileTextField extends StatelessWidget {
  final mobileNumberController;
  final Function mobileNumberChanges;

  LoginMobileTextField({
    this.mobileNumberController,
    this.mobileNumberChanges,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Colors.white,
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 15,
            bottom: 15,
            left: 20,
            child: Text(
              "+91",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: mobileNumberController,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.phone,
            maxLength: 10,
            onChanged: (value) {
              mobileNumberChanges(value);
            },
            decoration: InputDecoration(
              counterText: '',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              fillColor: Colors.black,
              hintText: "Mobile Number",
            ),
          ),
        ],
      ),
    );
  }
}
