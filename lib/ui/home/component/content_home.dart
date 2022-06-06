import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/theme.dart';

class ContentHome extends StatelessWidget {
  const ContentHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 30.h,
        horizontal: 24.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pencarian Terakhir',
            style:
                blackTextStyle.copyWith(fontSize: 18.sp, fontWeight: semiBold),
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: greyColor,
                        offset: const Offset(6, 6),
                        blurRadius: 4)
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 8.w,
                  ),
                  color: Colors.white,
                  height: 56.h,
                  width: 143.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40.h,
                        width: 40.h,
                        color: greyColor,
                      ),
                      Text(
                        'Indonesia',
                        style: blackTextStyle.copyWith(
                          fontSize: 18.sp,
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
