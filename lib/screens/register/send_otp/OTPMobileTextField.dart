import 'package:flutter/material.dart';

class OTPMobileTextField extends StatelessWidget {
  final Function mobileNumberChanges;
  final mobileNumberController;

  OTPMobileTextField({
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
      child: Stack(children: <Widget>[
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
          keyboardType: TextInputType.phone,
          maxLength: 10,
          onChanged: (value) {
            mobileNumberChanges(value);
          },
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            counterText: '',
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            fillColor: Colors.black,
            hintText: "Enter Mobile Number",
          ),
        ),
      ]),
    );
  }
}
