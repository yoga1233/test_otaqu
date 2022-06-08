import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_otaqu/cubit/last_search_cubit.dart';
import 'package:test_otaqu/services/shared_preferences.dart';
import 'package:test_otaqu/ui/widgets/custom_last_search_card.dart';

import '../../../shared/theme.dart';

class ContentHome extends StatefulWidget {
  const ContentHome({Key? key}) : super(key: key);

  @override
  State<ContentHome> createState() => _ContentHomeState();
}

class _ContentHomeState extends State<ContentHome> {
  @override
  void initState() {
    context.read<LastSearchCubit>().getLastSearch();

    super.initState();
  }

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<LastSearchCubit, LastSearchState>(
                builder: (context, state) {
                  if (state is LastSearchSuccess) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...state.data.map(
                            (dynamic e) => CustomLastSearchCard(e.toString()))
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
