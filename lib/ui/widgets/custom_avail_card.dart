import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_network/image_network.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:test_otaqu/model/avail_model.dart';
import 'package:test_otaqu/shared/theme.dart';

class CustomCardAvail extends StatelessWidget {
  final AvailModel avail;
  const CustomCardAvail(this.avail, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageUrl = avail.images![0];
    return InkWell(
      onTap: () {
        showMaterialModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18))),
            backgroundColor: Colors.white,
            context: context,
            builder: (context) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      child: Text(
                        avail.name.toString(),
                        style: blackTextStyle.copyWith(
                            fontSize: 18.sp, fontWeight: medium),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          'Price :',
                          style: blackTextStyle,
                        ),
                        const Spacer(),
                        Text(
                          NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(avail.price),
                          style: yellowTextStyle.copyWith(fontSize: 18.sp),
                        ),
                      ],
                    )
                  ],
                ),
              );
              // Material(
              //     child: SafeArea(
              //   top: false,
              //   child: Column(
              //     mainAxisSize: MainAxisSize.min,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         avail.name.toString(),
              //         style: blackTextStyle.copyWith(fontSize: 18.sp),
              //       )
              //     ],
              //   ),
              // ));
            });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 13,
        ),
        margin: EdgeInsets.only(
          bottom: 20.h,
        ),
        width: 341.w,
        height: 112.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: const Color(0xffF5F6F8)),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: ImageNetwork(
                  image: imageUrl,
                  height: 86.h,
                  width: 118.w,
                  onError: const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                )),
            SizedBox(
              width: 37.w,
            ),
            Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: greyTextStyle,
                ),
                SizedBox(
                  width: 150.w,
                  child: Text(
                    avail.name.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: blackTextStyle.copyWith(
                      fontSize: 18.sp,
                      fontWeight: medium,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  'Price',
                  style: greyTextStyle,
                ),
                Text(
                  NumberFormat.currency(
                          locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                      .format(avail.price),
                  style: yellowTextStyle.copyWith(fontSize: 18.sp),
                ),
                SizedBox(
                  height: 4.h,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
