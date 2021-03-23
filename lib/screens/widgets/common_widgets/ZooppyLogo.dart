import 'package:flutter/material.dart';

class ZooppyLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage('assets/zooppy.png'),
        ),
      ),
    );
  }
}
