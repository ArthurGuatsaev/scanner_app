import 'dart:io';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:test_work/services/initialize/initialize.dart';
import 'package:test_work/services/scanner/domain/model/document_model.dart';
import 'widgets/doc_actions.dart';
import 'widgets/sub_listener.dart';

class DocPage extends StatelessWidget {
  const DocPage({
    super.key,
    required this.doc,
  });
  final DocumentModel? doc;

  @override
  Widget build(BuildContext context) {
    final haveSub = context.myDependencies!.subR.premium;
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Stack(
          children: [
            if (doc != null)
              Center(
                  child: AspectRatio(
                      aspectRatio: 3 / 4,
                      child: SfPdfViewer.file(
                          canShowPageLoadingIndicator: true, File(doc!.path)))),
            DocActions(doc: doc, haveSub: haveSub),
            SubListener(path: doc?.path)
          ],
        ),
      ),
    );
  }
}
