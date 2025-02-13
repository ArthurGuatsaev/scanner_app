part of 'scan_bloc.dart';

sealed class ScanEvent {}

class PressTakeScan extends ScanEvent {}

class PressTakeGallery extends ScanEvent {}

class PressTakeFiles extends ScanEvent {}

class GetSavedDocuments extends ScanEvent {}

class PressSearchValue extends ScanEvent {
  final String value;

  PressSearchValue({required this.value});
}

class RemoveFileEvent extends ScanEvent {
  final String name;

  RemoveFileEvent({required this.name});
}

class SetTaskPlan extends ScanEvent {
  final TaskPlan? task;

  SetTaskPlan({this.task});
}

class PressSharePdf extends ScanEvent {
  final String path;

  PressSharePdf({required this.path});
}

class PressPrintSharePdf extends ScanEvent {
  final String path;

  PressPrintSharePdf({required this.path});
}

class PlanTaskPdf extends ScanEvent {
  final String path;

  PlanTaskPdf({required this.path});
}
