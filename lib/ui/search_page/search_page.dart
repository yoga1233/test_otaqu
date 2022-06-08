import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:test_otaqu/cubit/search_cubit.dart';
import 'package:test_otaqu/model/avail_model.dart';
import 'package:test_otaqu/services/last_search_service.dart';
import 'package:test_otaqu/shared/theme.dart';
import 'package:test_otaqu/ui/widgets/custom_avail_card.dart';

import '../../services/api_service.dart';
import '../../services/search_service.dart';
import '../../services/shared_preferences.dart';
import '../widgets/typeahead.dart';

class SearchPage extends StatefulWidget {
  final String query;
  final int destinationId;

  const SearchPage({
    Key? key,
    required this.destinationId,
    required this.query,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    context.read<SearchCubit>().search(widget.destinationId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController cSearch = TextEditingController(text: widget.query);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: TypeaHead(
            controllerText: cSearch,
            onSugesSelect: (suggestion) async {
              cSearch.text = suggestion;
              LastSearchService().save(cSearch.text);
              int id = await SearchService().getId(cSearch.text);
              if (!mounted) return;
              context.read<SearchCubit>().search(id);
            },
            onTap: () async {
              int id = await SearchService().getId(cSearch.text);
              LastSearchService().save(cSearch.text);
              String bearer = await SharedPrefService().getToken();
              bool isExpired = Jwt.isExpired(bearer);
              if (!isExpired) {
                if (!mounted) return;
                context.read<SearchCubit>().search(id);
              } else {
                SharedPrefService().deleteToken;
                await ApiService().auth();
                if (!mounted) return;
                showDialog(
                    context: context,
                    builder: (context) {
                      return const Text('Sessions Habis');
                    });
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              }
            },
          ),
          centerTitle: true,
          backgroundColor: redcolor,
          toolbarHeight: 103.h,
        ),
        body: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchSuccess) {
                  return ListView(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      ...state.avail
                          .map((AvailModel avail) => CustomCardAvail(avail))
                          .toList()
                    ],
                  );
                } else if (state is SearchFailed) {
                  return const Center(
                    child: Text('Data Not Found!'),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )),
      ),
    );
  }
}
