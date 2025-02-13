import 'dart:async';

import 'package:bloc/bloc.dart';

part 'error_event.dart';
part 'error_state.dart';

class ErrorBloc extends Bloc<ErrorEvent, ErrorState> {
  final StreamController<int> controller;
  StreamSubscription<int>? subscription;
  ErrorBloc({required this.controller}) : super(ErrorState()) {
    subscription =
        controller.stream.listen((event) => add(ErrorShoutEvent(code: event)));
    on<ErrorShoutEvent>(showError);
  }

  showError(ErrorShoutEvent event, Emitter<ErrorState> emit) async {
    emit(state.copyWith(code: event.code, status: ErrorStatus.error));
    Future.delayed(Duration.zero);
    emit(state.copyWith(status: ErrorStatus.initial));
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    subscription = null;
    return super.close();
  }
}
