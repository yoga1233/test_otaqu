import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/shared_preferences.dart';

part 'last_search_state.dart';

class LastSearchCubit extends Cubit<LastSearchState> {
  LastSearchCubit() : super(LastSearchInitial());

  void getLastSearch() async {
    emit(LastSearchLoading());
    String data = await SharedPrefService().getLastSearch();
    print(data);
    if (data != 'null') {
      List result = jsonDecode(data);

      emit(LastSearchSuccess(result));
    } else {
      List<String> result = [];
      emit(LastSearchSuccess(result));
    }
  }
}
