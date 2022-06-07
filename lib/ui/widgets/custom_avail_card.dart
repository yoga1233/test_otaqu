import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_otaqu/model/avail_model.dart';
import 'package:test_otaqu/shared/theme.dart';

class CustomCardAvail extends StatelessWidget {
  final AvailModel avail;
  const CustomCardAvail(this.avail, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25.h),
      height: 100,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network(
              avail.images![0],
              errorBuilder: (context, error, stackTrace) => Text(
                'Image Not Found',
                style: blackTextStyle,
              ),
              width: 100.w,
              height: 100.h,
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
              Expanded(
                child: Text(
                  avail.name.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: blackTextStyle.copyWith(
                    fontSize: 18.sp,
                    fontWeight: medium,
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                avail.day.toString(),
                style:
                    greyTextStyle.copyWith(fontWeight: light, fontSize: 14.sp),
              ),
              const Spacer(),
              Text(
                'IDR ${avail.price}',
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
