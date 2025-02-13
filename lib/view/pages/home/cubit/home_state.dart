// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

class HomeState {
  final int pageIndex;

  HomeState({this.pageIndex = 1});

  HomeState copyWith({
    int? pageIndex,
  }) {
    return HomeState(
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }
}
