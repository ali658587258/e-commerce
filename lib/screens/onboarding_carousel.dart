import 'package:commerce/screens/Authentication/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_animation/onboarding_animation.dart';

import '../components/on_boarding/card_on_boarding.dart';
import '../src/app_color.dart';


class OnboardingCarousel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: OnBoardingAnimation(pages: [
          CardOnBoarding(
            text: '      Browse the menu\n and order directly from\n        the application',
            urlImage: 'assets/images/onboarding1.png',
          ),
          CardOnBoarding(
            text: '       Your order will be\nimmediately collected and\n     send by our courier',
            urlImage: 'assets/images/onboarding2.png',
          ),
          CardOnBoarding(
            text: '      Pick up delivery\nat your door and enjoy\n           groceries',
            urlImage: 'assets/images/onboarding3.png',
            isLast: true,
          )
        ],
            indicatorActiveDotColor: AppColor.KMainColor,
          indicatorInActiveDotColor: AppColor.kWhiteColor,
        ),
      ),
    );
  }
}
