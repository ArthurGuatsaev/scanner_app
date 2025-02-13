part of '../router.dart';

class MyNavigationState extends ChangeNotifier {
  MyNavigationState.home({this.home = true});
  MyNavigationState.board({this.board = true});
  MyNavigationState.sub({this.sub = true, this.home = true});
  MyNavigationState.subDoc(
      {this.sub = true, this.doc = true, this.home = true});
  MyNavigationState.doc({this.doc = true, this.home = true});

  bool home = false;
  bool board = false;
  bool sub = false;
  bool subDoc = false;
  bool doc = false;
}
