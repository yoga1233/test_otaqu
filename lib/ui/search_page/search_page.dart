import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_otaqu/shared/theme.dart';
import 'package:test_otaqu/ui/widgets/custom_avail_card.dart';
import 'package:test_otaqu/ui/widgets/custom_search.dart';

class SearchPage extends StatelessWidget {
  final String query;

  const SearchPage({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController cSearch = TextEditingController(text: query);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomSearch(
          onTap: () {},
          controller: cSearch,
          onSubmit: (value) {},
        ),
        centerTitle: true,
        backgroundColor: redcolor,
        toolbarHeight: 103.h,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 40.h,
            ),
            const CustomCardAvail(),
          ],
        ),
      ),
    );
  }
}
