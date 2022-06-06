import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_otaqu/shared/theme.dart';
import 'package:test_otaqu/ui/intro_page.dart/intro_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const IntroPage(),
            ),
            (route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
              child: Image.asset(
            'assets/OTAQU-1000X750-fit.png',
            width: 311.w,
            height: 88.h,
            fit: BoxFit.cover,
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 30.h),
              child: Text(
                'Powered By : Otaqu.id',
                style: blackTextStyle.copyWith(fontSize: 18.sp),
              ),
            ),
          )
        ],
      ),
    );
  }
}