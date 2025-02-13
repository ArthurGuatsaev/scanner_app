// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'scan_bloc.dart';

class ScanState {
  final List<DocumentModel> pictures;
  final TaskPlan taskPlan;
  final ScanStatus status;
  final String searchKey;
  ScanState({
    this.pictures = const [],
    this.taskPlan = TaskPlan.none,
    this.status = ScanStatus.initial,
    this.searchKey = '',
  });

  ScanState copyWith({
    List<DocumentModel>? pictures,
    TaskPlan? taskPlan,
    ScanStatus? status,
    String? searchKey,
  }) {
    return ScanState(
      pictures: pictures ?? this.pictures,
      taskPlan: taskPlan ?? this.taskPlan,
      status: status ?? this.status,
      searchKey: searchKey ?? this.searchKey,
    );
  }

  bool get isLoading => status == ScanStatus.loading;

  List<DocumentModel> get searchList {
    if (searchKey.isEmpty) return pictures;
    return pictures
        .where((element) =>
            element.name.toLowerCase().contains(searchKey.toLowerCase()))
        .toList();
  }
}

enum TaskPlan {
  none,
  print,
  share,
}

enum ScanStatus {
  initial,
  loading,
}
