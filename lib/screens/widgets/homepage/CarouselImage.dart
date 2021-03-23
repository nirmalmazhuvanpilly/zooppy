import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  final String cardImage;
  final void Function() cardAction;
  CarouselImage({
    this.cardImage,
    this.cardAction,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
          cardImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
