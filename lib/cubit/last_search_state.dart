part of 'last_search_cubit.dart';

abstract class LastSearchState extends Equatable {
  const LastSearchState();

  @override
  List<Object> get props => [];
}

class LastSearchInitial extends LastSearchState {}

class LastSearchLoading extends LastSearchState {}

class LastSearchSuccess extends LastSearchState {
  final List data;
  const LastSearchSuccess(this.data);
  @override
  List<Object> get props => [data];
}

class LastSearchFailed extends LastSearchState {
  final String eror;
  const LastSearchFailed(this.eror);
  @override
  List<Object> get props => [eror];
}
