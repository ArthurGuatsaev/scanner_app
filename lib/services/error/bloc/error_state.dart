// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'error_bloc.dart';

class ErrorState {
  final int code;
  final ErrorStatus status;

  ErrorState({
    this.code = 0,
    this.status = ErrorStatus.initial,
  });

  ErrorState copyWith({
    int? code,
    ErrorStatus? status,
  }) {
    return ErrorState(
      code: code ?? this.code,
      status: status ?? this.status,
    );
  }

  bool get isError => status == ErrorStatus.error;
}

enum ErrorStatus {
  initial,
  error,
}
