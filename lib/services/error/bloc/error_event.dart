part of 'error_bloc.dart';

sealed class ErrorEvent {}

class ErrorShoutEvent extends ErrorEvent {
  final int code;
  ErrorShoutEvent({required this.code});
}
