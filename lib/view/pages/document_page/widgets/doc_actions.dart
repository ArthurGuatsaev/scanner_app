import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/routings/router.dart';
import 'package:test_work/services/scanner/data/bloc/scan_bloc.dart';
import 'package:test_work/services/scanner/domain/model/document_model.dart';

class DocActions extends StatelessWidget {
  const DocActions({
    super.key,
    required this.doc,
    required this.haveSub,
  });

  final DocumentModel? doc;
  final bool haveSub;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: Navigator.of(context).pop,
            child: Image.asset('assets/images/back.png')),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36), color: Colors.white),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    if (doc == null) return;
                    if (!haveSub) {
                      MyNavigatorManager.instance.pushSubFromDoc();
                      context
                          .read<ScanBloc>()
                          .add(SetTaskPlan(task: TaskPlan.share));
                    } else {
                      context
                          .read<ScanBloc>()
                          .add(PressSharePdf(path: doc!.path));
                    }
                  },
                  child: Image.asset('assets/images/share.png')),
              const SizedBox(width: 10),
              GestureDetector(
                  onTap: () {
                    if (doc == null) return;
                    if (!haveSub) {
                      MyNavigatorManager.instance.pushSubFromDoc();
                      context
                          .read<ScanBloc>()
                          .add(SetTaskPlan(task: TaskPlan.print));
                    } else {
                      context
                          .read<ScanBloc>()
                          .add(PressPrintSharePdf(path: doc!.path));
                    }
                  },
                  child: Image.asset('assets/images/print.png')),
              const SizedBox(width: 10),
              GestureDetector(
                  onTap: () {
                    if (doc == null) return;
                    Navigator.of(context).pop();
                    context
                        .read<ScanBloc>()
                        .add(RemoveFileEvent(name: doc!.path));
                  },
                  child: Image.asset('assets/images/delete.png')),
            ],
          ),
        ),
      ],
    );
  }
}
