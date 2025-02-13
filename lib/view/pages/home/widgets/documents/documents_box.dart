import 'dart:io';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:test_work/routings/router.dart';
import 'package:test_work/services/scanner/domain/model/document_model.dart';
import 'doc_name_row.dart';

class DocumentsBox extends StatelessWidget {
  const DocumentsBox({super.key, required this.docs});
  final List<DocumentModel> docs;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: docs.length,
      itemBuilder: (context, index) {
        final doc = docs[index];
        return GestureDetector(
          onTap: () => MyNavigatorManager.instance.pushDoc(doc),
          child: Container(
            height: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), color: Colors.white),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffF5F5F5)),
                  child: DocImageRow(doc: doc),
                ),
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DocNameRow(name: doc.name),
                      const Spacer(),
                      Text(
                        doc.viewDate,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.25)),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset('assets/images/navigate.png'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class DocImageRow extends StatelessWidget {
  const DocImageRow({
    super.key,
    required this.doc,
  });

  final DocumentModel doc;

  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.file(
      canShowPageLoadingIndicator: true,
      File(doc.path),
    );
    // return pw.Image(Image.asset('name'));
  }
}
