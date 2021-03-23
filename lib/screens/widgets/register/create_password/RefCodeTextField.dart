import 'package:flutter/material.dart';

class RefCodeTextField extends StatelessWidget {
  final refCodeController;
  RefCodeTextField({
    this.refCodeController,
  });
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
        controller: refCodeController,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          fillColor: Colors.black,
          hintText: "Enter Referral code",
        ),
      ),
    );
  }
}
