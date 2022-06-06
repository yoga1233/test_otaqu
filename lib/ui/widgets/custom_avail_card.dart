import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_otaqu/shared/theme.dart';

class CustomCardAvail extends StatelessWidget {
  const CustomCardAvail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25.h),
      height: 100,
      child: Row(
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), color: greyColor
                // image: const DecorationImage(
                //     image: AssetImage('assets/intro1.png'), fit: BoxFit.cover),
                ),
          ),
          SizedBox(
            width: 11.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 4.h,
              ),
              Text(
                'Java Jass',
                style: blackTextStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                'indonesia',
                style:
                    greyTextStyle.copyWith(fontWeight: light, fontSize: 14.sp),
              ),
              const Spacer(),
              Text(
                'IDR 1.000.000',
                style: yellowTextStyle.copyWith(
                    fontSize: 18.sp, fontWeight: medium),
              ),
              SizedBox(
                height: 4.h,
              ),
            ],
          )
        ],
      ),
    );
  }
}
