import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_otaqu/shared/theme.dart';
import 'package:test_otaqu/ui/home/component/carousel_home.dart';
import 'package:test_otaqu/ui/home/component/content_home.dart';
import 'package:test_otaqu/ui/home/component/header_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          // physics: const NeverScrollableScrollPhysics(),
          children: [
            Stack(
              children: [
                Container(
                  height: 183,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: redcolor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    HeaderHome(),
                    CarouselHome(),
                    ContentHome(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
