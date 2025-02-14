import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/services/error/bloc/error_bloc.dart';
import 'package:test_work/services/error/view/error_snackbar.dart';

class ErrorHomeListener extends StatelessWidget {
  const ErrorHomeListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ErrorBloc, ErrorState>(
      listenWhen: (previous, current) => previous.code != current.code,
      listener: (context, state) {
        if (state.isError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(errorSnackBar(context, state.code));
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
