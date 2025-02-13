import 'package:bloc/bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  setIndex(int page) {
    emit(state.copyWith(pageIndex: page));
  }
}
