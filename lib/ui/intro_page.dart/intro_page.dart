import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:test_otaqu/shared/theme.dart';
import 'package:test_otaqu/ui/home/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageDecoration getPagedecoration() {
      return PageDecoration(
          imagePadding: EdgeInsets.only(top: 128.h),
          titlePadding: EdgeInsets.only(top: 70.h),
          bodyPadding: EdgeInsets.only(top: 20.h),
          titleTextStyle:
              blackTextStyle.copyWith(fontSize: 24.sp, fontWeight: semiBold),
          bodyTextStyle:
              greyTextStyle.copyWith(fontSize: 18.sp, fontWeight: regular));
    }

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
            title: 'Travel with easy',
            body:
                'Dont’n know want to travel? we will\nsuggest things to destinations\nand easy for booking',
            image: Image.asset(
              'assets/intro1.png',
              width: 291.w,
              height: 219.h,
            ),
            decoration: getPagedecoration()),
        PageViewModel(
            title: 'Lets Traveling',
            body:
                'Are you ready for vacation? create\nbooking and lets to travel',
            image: Image.asset(
              'assets/intro2.png',
              width: 285.w,
              height: 232.h,
            ),
            decoration: getPagedecoration()),
      ],
      skip: Text(
        'Skip',
        style: blackTextStyle.copyWith(fontSize: 14.sp, fontWeight: semiBold),
      ),
      showSkipButton: true,
      showNextButton: true,
      done: Text(
        'Get Started',
        style: blackTextStyle.copyWith(fontSize: 14.sp, fontWeight: semiBold),
      ),
      onDone: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
            (route) => false);
      },
      onSkip: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
            (route) => false);
      },
      next: Text(
        'Next',
        style: blackTextStyle.copyWith(fontSize: 14.sp, fontWeight: semiBold),
      ),
      dotsDecorator: DotsDecorator(
          color: greyColor,
          size: const Size(10, 10),
          activeColor: purpleColor,
          activeSize: const Size(22, 10),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
    );
  }
}
