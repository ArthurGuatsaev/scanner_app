import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:test_work/services/scanner/domain/model/document_model.dart';
import 'package:test_work/services/scanner/domain/repository/base_scanner_repository.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  final BaseScannerRepository scanR;
  ScanBloc({required this.scanR})
      : super(ScanState(pictures: scanR.savedDocs)) {
    on<PressTakeScan>(takeScan);
    on<PressTakeGallery>(chooseGallery);
    on<PressTakeFiles>(chooseFile);
    on<GetSavedDocuments>(getSavedDoc);
    on<PressPrintSharePdf>(printPdf);
    on<PressSharePdf>(sharePdf);
    on<SetTaskPlan>(setTaskPlan);
    on<PlanTaskPdf>(planPdf);
    on<RemoveFileEvent>(removeFile);
    on<PressSearchValue>(search);
  }

  takeScan(PressTakeScan event, Emitter<ScanState> emit) async {
    emit(state.copyWith(status: ScanStatus.loading));
    await scanR.scanDocument();
    add(GetSavedDocuments());
  }

  chooseGallery(PressTakeGallery event, Emitter<ScanState> emit) async {
    emit(state.copyWith(status: ScanStatus.loading));
    await scanR.pickImage();
    add(GetSavedDocuments());
  }

  chooseFile(PressTakeFiles event, Emitter<ScanState> emit) async {
    emit(state.copyWith(status: ScanStatus.loading));
    await scanR.pickFile();
    add(GetSavedDocuments());
  }

  getSavedDoc(GetSavedDocuments event, Emitter<ScanState> emit) async {
    final pic = await scanR.getSavedDoc();
    emit(state.copyWith(pictures: pic, status: ScanStatus.initial));
  }

  planPdf(PlanTaskPdf event, Emitter<ScanState> emit) async {
    if (state.taskPlan == TaskPlan.share) {
      add(PressSharePdf(path: event.path));
    } else {
      add(PressPrintSharePdf(path: event.path));
    }
  }

  sharePdf(PressSharePdf event, Emitter<ScanState> emit) async {
    final file = File(event.path);
    final uint = await file.readAsBytes();
    await Printing.sharePdf(bytes: uint, filename: 'my-document.pdf');
  }

  printPdf(PressPrintSharePdf event, Emitter<ScanState> emit) async {
    final file = File(event.path);
    final uint = await file.readAsBytes();
    await Printing.layoutPdf(onLayout: (PdfPageFormat format) => uint);
  }

  setTaskPlan(SetTaskPlan event, Emitter<ScanState> emit) async {
    emit(state.copyWith(taskPlan: event.task ?? TaskPlan.none));
  }

  removeFile(RemoveFileEvent event, Emitter<ScanState> emit) async {
    emit(state.copyWith(status: ScanStatus.loading));
    await scanR.removeFile(event.name);
    add(GetSavedDocuments());
  }

  search(PressSearchValue event, Emitter<ScanState> emit) async {
    emit(state.copyWith(searchKey: event.value));
  }
}
