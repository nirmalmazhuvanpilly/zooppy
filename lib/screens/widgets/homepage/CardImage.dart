import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final void Function() cardAction;
  final String image;
  CardImage({
    this.cardAction,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 125,
      child: GestureDetector(
        onTap: cardAction,
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          // color: Colors.red,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
