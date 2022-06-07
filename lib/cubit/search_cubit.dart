import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_otaqu/model/avail_model.dart';
import 'package:test_otaqu/services/api_service.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void search(int id) async {
    try {
      emit(SearchLoading());
      List<AvailModel> avail = await ApiService().getDataAvail(id);
      emit(SearchSuccess(avail));
    } catch (e) {
      emit(SearchFailed(e.toString()));
    }
  }
}
