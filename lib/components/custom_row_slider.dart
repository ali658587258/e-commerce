import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'card_image.dart';

class CustomRowSlider extends StatelessWidget {
  const CustomRowSlider({super.key});


  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: [
          CardImage(image: 'assets/images/onboarding1.png'),
          CardImage(image: 'assets/images/onboarding2.png'),
          CardImage(image: 'assets/images/onboarding3.png'),
          CardImage(image: 'assets/images/onboarding1.png')
        ],

        options:  CarouselOptions(
          height: 180.h,
          autoPlay: true,
          aspectRatio: 16/9,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          viewportFraction: 0.8,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          enlargeFactor: 0.4,
        )
    );
    ;
  }
}
