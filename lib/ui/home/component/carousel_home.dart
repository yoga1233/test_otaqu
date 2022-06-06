import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselHome extends StatelessWidget {
  const CarouselHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/promo1.png',
      'assets/promo2.png',
      'assets/promo3.png'
    ];

    return CarouselSlider(
      items: imgList
          .map((item) => Image.asset(
                item,
                fit: BoxFit.cover,
                height: 69.h,
                width: 336.w,
              ))
          .toList(),
      options: CarouselOptions(
        height: 69.h,
        enlargeCenterPage: true,
        // enableInfiniteScroll: false,
        autoPlay: true,
      ),
    );
  }
}
