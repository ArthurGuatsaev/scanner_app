import 'dart:async';

import 'package:test_work/services/scanner/domain/model/document_model.dart';

abstract class BaseScannerRepository {
  BaseScannerRepository({required this.errorController});
  final StreamController<int> errorController;
  List<DocumentModel> savedDocs = [];
  Future<List<String>?> scanDocument();
  Future<void> pickImage();
  Future<void> pickFile();
  Future<List<DocumentModel>> getSavedDoc();
  Future<void> removeFile(String name);
}
