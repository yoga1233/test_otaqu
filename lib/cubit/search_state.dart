part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<AvailModel> avail;
  const SearchSuccess(this.avail);
  @override
  List<Object> get props => [avail];
}

class SearchFailed extends SearchState {
  final String eror;
  const SearchFailed(this.eror);
  @override
  List<Object> get props => [eror];
}
