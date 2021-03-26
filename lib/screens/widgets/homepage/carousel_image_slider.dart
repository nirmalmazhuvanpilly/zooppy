import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselImageSlider extends StatelessWidget {
  final List carouselList;
  final double carouselHeight;

  CarouselImageSlider({
    this.carouselList,
    this.carouselHeight,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: carouselList.map((card) {
        return Builder(builder: (BuildContext context) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            child: card,
          );
        });
      }).toList(),
      options: CarouselOptions(
        height: carouselHeight,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        viewportFraction: 1,
        // aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
    );
  }
}
