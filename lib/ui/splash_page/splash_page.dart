import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:test_otaqu/services/api_service.dart';
import 'package:test_otaqu/services/shared_preferences.dart';
import 'package:test_otaqu/shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () async {
      String dest = await SharedPrefService().getDestination();
      String bearer = await SharedPrefService().getToken();
      bool intro = await SharedPrefService().getIntro();
      if (dest != 'null') {
        if (bearer != 'null') {
          bool isExpired = Jwt.isExpired(bearer);
          if (!isExpired) {
            if (intro) {
              if (!mounted) return;
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            } else {
              if (!mounted) return;
              Navigator.pushNamedAndRemoveUntil(
                  context, '/intro', (route) => false);
            }
          } else {
            SharedPrefService().deleteToken;
            await ApiService().auth();
            if (intro) {
              if (!mounted) return;
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            } else {
              if (!mounted) return;
              Navigator.pushNamedAndRemoveUntil(
                  context, '/intro', (route) => false);
            }
          }
        } else {
          await ApiService().auth();
          if (!mounted) return;
          Navigator.pushNamedAndRemoveUntil(
              context, '/intro', (route) => false);
        }
      } else {
        ApiService().auth;
        ApiService().getDestination();
        if (bearer != 'null') {
          bool isExpired = Jwt.isExpired(bearer);
          if (!isExpired) {
            if (intro) {
              if (!mounted) return;
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            } else {
              if (!mounted) return;
              Navigator.pushNamedAndRemoveUntil(
                  context, '/intro', (route) => false);
            }
          } else if (isExpired) {
            await ApiService().auth();
            if (intro) {
              if (!mounted) return;
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            } else {
              if (!mounted) return;
              Navigator.pushNamedAndRemoveUntil(
                  context, '/intro', (route) => false);
            }
          }
        } else {
          await ApiService().auth();
          if (!mounted) return;
          Navigator.pushNamedAndRemoveUntil(
              context, '/intro', (route) => false);
        }
      }
    });

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
