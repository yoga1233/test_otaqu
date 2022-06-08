import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../services/search_service.dart';
import '../../shared/theme.dart';
import '../search_page/search_page.dart';

class CustomLastSearchCard extends StatefulWidget {
  final String city;
  const CustomLastSearchCard(this.city, {Key? key}) : super(key: key);

  @override
  State<CustomLastSearchCard> createState() => _CustomLastSearchCardState();
}

class _CustomLastSearchCardState extends State<CustomLastSearchCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        int id = await SearchService().getId(widget.city);
        if (!mounted) return;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  SearchPage(destinationId: id, query: widget.city),
            ));
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(bottom: 20),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: greyColor, offset: const Offset(6, 6), blurRadius: 4)
            ],
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 6.h,
            ),
            color: Colors.white,
            child: Center(
              child: Text(
                widget.city,
                style: blackTextStyle.copyWith(
                    fontSize: 18.sp, fontWeight: medium),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
