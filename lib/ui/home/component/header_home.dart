import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_otaqu/services/search_service.dart';
import 'package:test_otaqu/ui/home/component/typeahead.dart';
import '../../../shared/theme.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController cSearch = TextEditingController(text: '');
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 30.h,
        horizontal: 24.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi, Welcome to\nOTAQU',
            style:
                whiteTextStyle.copyWith(fontSize: 24.sp, fontWeight: semiBold),
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            'Penawaran terbaik tiap harinya',
            style: whiteTextStyle.copyWith(fontSize: 16.sp, fontWeight: light),
          ),
          Container(
            margin: EdgeInsets.only(top: 22.h),
            child: TypeaHead(
              controllerText: cSearch,
              onTap: () async {
                int id = await SearchService().getId(cSearch.text);
                print(id);
              },
            ),
            // CustomSearch(
            //   iconTap: () {},
            //   controller: cSearch,
            //   onSubmit: (value) {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => SearchPage(query: cSearch.text),
            //         ));
            //     return null;
            //   },
            // )
          ),
        ],
      ),
    );
  }
}
