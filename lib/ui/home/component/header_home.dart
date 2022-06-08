import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_otaqu/services/search_service.dart';
import 'package:test_otaqu/services/shared_preferences.dart';
import 'package:test_otaqu/ui/widgets/typeahead.dart';
import 'package:test_otaqu/ui/search_page/search_page.dart';
import '../../../services/last_search_service.dart';
import '../../../shared/theme.dart';

class HeaderHome extends StatefulWidget {
  const HeaderHome({Key? key}) : super(key: key);

  @override
  State<HeaderHome> createState() => _HeaderHomeState();
}

class _HeaderHomeState extends State<HeaderHome> {
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
              onSugesSelect: (suggestion) {
                cSearch.text = suggestion;
              },
              controllerText: cSearch,
              onTap: () async {
                int id = await SearchService().getId(cSearch.text);
                String lastSearch = await SharedPrefService().getLastSearch();
                if (lastSearch != 'null') {
                  LastSearchService().save(cSearch.text);
                } else {
                  List result = [];
                  result.add(cSearch.text);
                  SharedPrefService().setLastSearch(result);
                }
                if (!mounted) return;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SearchPage(destinationId: id, query: cSearch.text),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
