import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import '../components/large_home_icon.dart';

import '../models/get_image_url.dart';

class CarouselWidget extends StatelessWidget {
  var carouselIcons = {
    {
      'image': 'carousel_icon.jpg',
    },
    {
      'image': 'carousel_icon1.jpg',
    },
    {
      'image': 'carousel_icon2.jpg',
    },
    {
      'image': 'carousel_icon3.jpg',
    },
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      child: Carousel(
        boxFit: BoxFit.fill,
        autoplay: true,
        autoplayDuration: Duration(seconds: 5),
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 6.0,
        dotIncreasedColor: Colors.black,
        dotBgColor: Colors.transparent,
        dotPosition: DotPosition.bottomLeft,
        dotVerticalPadding: 10.0,
        showIndicator: true,
        indicatorBgPadding: 7.0,
        images: carouselIcons
            .map(
              (entry) => LargeIcon(
                getImageURL(entry['image']),
              ),
            )
            .toList(),
      ),
    );
  }
}
