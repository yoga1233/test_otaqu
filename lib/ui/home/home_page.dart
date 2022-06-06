import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_otaqu/services/shared_preferences.dart';
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
          physics: const NeverScrollableScrollPhysics(),
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
                  children: [
                    const HeaderHome(),
                    const CarouselHome(),
                    const ContentHome(),
                    InkWell(
                        onTap: () async {
                          final String result =
                              await SharedPrefService().getDestination();
                          print(result);
                          // ApiService().getDestination(
                          // 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMTUuODUuODAuMzRcL3V0aWxpemF0aW9uXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNjU0NTIyNTQ0LCJleHAiOjE2NTQ1MjYxNDQsIm5iZiI6MTY1NDUyMjU0NCwianRpIjoiRGszWE1rbVFzU3RnQmp3SCIsInN1YiI6NTYsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.1n4X2yko6InnsPKJ-Bk_wCAdPYEzFgejjXzsq5gNUak');
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          color: redcolor,
                        ))
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
