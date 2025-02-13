import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

mixin MyConverterFile {
  Future<String> convertFile(File file) async {
    try {
      final path = file.path;
      final index = path.lastIndexOf('.');
      final last = path.lastIndexOf('/');
      final name = path.substring(last + 1, index);
      final ext = path.substring(index);
      final client =
          dio.Dio(dio.BaseOptions(baseUrl: 'https://pdfconverterkit.click'));
      final response = await client.post("/converter_kit",
          data: dio.FormData.fromMap({
            'kit': await dio.MultipartFile.fromFile(file.path,
                filename: 'aasa$ext')
          }));
      if (response.statusCode == 200) {
        final resp = await http.Client().get(Uri.parse(response.data));
        if (resp.statusCode == 200) {
          final random = DateTime.now().microsecondsSinceEpoch;
          final path = await getApplicationDocumentsDirectory();
          final pdf = File('${path.path}/${name}___$random.pdf');
          await pdf.writeAsBytes(resp.bodyBytes, mode: FileMode.write);
        }
        return response.data as String;
      }
      return '';
    } catch (e) {
      log('error $e');
      return '';
    }
  }

  Future<pw.Document> convertImage(Uint8List image) async {
    final pdf = pw.Document();
    pw.Image image1 = pw.Image(pw.MemoryImage(image));

    pdf.addPage(pw.Page(build: (pw.Context context) {
      return pw.Center(child: image1); // Center
    }));
    return pdf;
  }

  // Future<pw.Document> convertFileNetwork(String ntw) async {
  //   // final ByteData data = await rootBundle.load('assets/sample.pdf');
  //   // // Load your PDF file
  //   // final Uint8List bytes = data.buffer.asUint8List();
  //   // // Now, you can manipulate or read the PDF bytes here // Example: load pdf into a PDF document
  //   // final pdf = pw.Document();
  //   // pdf.addPage(pw.Page(build: (pw.Context context) {
  //   //   return pw.Center(child: pw.Text('Hello World'));
  //   // }));
  //   // final outputFile = File('output.pdf');
  //   // await outputFile.writeAsBytes(await pdf.save());
  // }
}
