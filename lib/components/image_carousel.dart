import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import '../components/large_home_icon.dart';

class CarouselWidget extends StatelessWidget {
  var carouselIcons = {
    {
      'image': 'assets/images/carousel/carousel_icon.jpg',
    },
    {
      'image': 'assets/images/carousel/carousel_icon1.jpg',
    },
    {
      'image': 'assets/images/carousel/carousel_icon2.jpg',
    },
    {
      'image': 'assets/images/carousel/carousel_icon3.jpg',
    },
    // {
    //   'image': 'jurong_jc_stadium.jpg',
    //   'location': 'Jurong',
    //   'rating': '3.5',
    //   'stadium': 'Jurong JC Stadium'
    // },
    // {
    //   'image': 'jalan_besar_stadium.jpg',
    //   'location': 'Jalan Besar',
    //   'rating': '4.4',
    //   'stadium': 'Jalan Besar Stadium'
    // },
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
                entry['image'],
              ),
            )
            .toList(),
      ),
    );
  }
}
