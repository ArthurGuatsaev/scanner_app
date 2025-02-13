import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/services/scanner/data/bloc/scan_bloc.dart';
import 'package:test_work/services/subscription/data/bloc/sub_bloc.dart';

class SubListener extends StatelessWidget {
  const SubListener({
    super.key,
    this.path,
  });
  final String? path;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubBloc, SubState>(
      listenWhen: (previous, current) => previous.haveSub != current.haveSub,
      listener: (context, state) {
        if (state.haveSub) {
          if (path != null) {
            context.read<ScanBloc>().add(PlanTaskPdf(path: path!));
          }
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
