import 'dart:developer';
import 'dart:io';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_work/services/scanner/domain/model/document_model.dart';
import 'package:test_work/services/scanner/domain/repository/base_scanner_repository.dart';
import 'package:pdf/widgets.dart' as pw;
import 'converter/converter.dart';

class DocumentScannerRepository extends BaseScannerRepository
    with MyConverterFile {
  DocumentScannerRepository({required super.errorController});

  @override
  Future<List<String>?> scanDocument() async {
    try {
      final pictures = await CunningDocumentScanner.getPictures(
          isGalleryImportAllowed: true);
      final uint = await File(pictures!.last).readAsBytes();
      final pdf = await convertImage(uint);
      await removeFile(pictures.last);
      await saveDocument(pdf, 'ScanDocument');
      return pictures;
    } catch (e) {
      errorController.add(111);
      return null;
    }
  }

  @override
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    final uint = await photo?.readAsBytes();
    if (uint == null) return errorController.add(111);
    final pdf = await convertImage(uint);
    await saveDocument(pdf, 'GalleryDocument');
  }

  @override
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        // allowedExtensions: ['doc', 'docx', 'xls', 'xlsx', 'pdf'],
        );
    if (result != null) {
      File file = File(result.files.single.path!);
      await convertFile(file);

      // final pdf = await convertFileNetwork('file');
      // await saveDocument(pdf, 'FileDocument');
    } else {
      return errorController.add(111);
    }
  }

  Future<void> saveDocument(pw.Document pdf, String name) async {
    try {
      final basedir = await getApplicationDocumentsDirectory();
      final randomName = DateTime.now().microsecondsSinceEpoch;
      final file = File("${basedir.path}/${name}___$randomName.pdf");
      await file.writeAsBytes(await pdf.save());
    } catch (e) {
      log('error $e');
    }
  }

  @override
  Future<List<DocumentModel>> getSavedDoc() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final files = await dir.list().toList();
      final pdfFiles = files.where((doc) => doc.path.contains('pdf')).toList();
      final docs = pdfFiles
          .map((e) => DocumentModel(path: e.path, date: e.statSync().modified))
          .toList();
      return savedDocs = docs;
    } catch (e) {
      errorController.add(112);
      return [];
    }
  }

  @override
  Future<void> removeFile(String name) async {
    final file = File(name);
    await file.delete();
  }
}
