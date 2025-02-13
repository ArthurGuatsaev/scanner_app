import 'package:date_time_format/date_time_format.dart';

class DocumentModel {
  final String path;
  final DateTime date;

  DocumentModel({required this.path, required this.date});
  String get name {
    final ind = path.lastIndexOf('/');
    final endIndex = path.indexOf('___');
    if (endIndex == -1) return 'ScannerDoc';
    final name = path.substring(ind + 1, endIndex);
    return name;
  }

  String get viewDate {
    String formattedDate3 = date.format(AmericanDateFormats.dayOfWeek);
    return formattedDate3;
  }
}
