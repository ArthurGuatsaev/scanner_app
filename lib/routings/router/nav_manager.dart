part of '../router.dart';

class MyNavigatorManager {
  MyNavigatorManager._();
  static MyNavigatorManager instance = MyNavigatorManager._();
  final key = GlobalKey<NavigatorState>();
  static final MyRouterDelegate delegate = MyRouterDelegate.instance;
  NavigatorState? get nav => key.currentState;

  Future<void> simulatorPop() async {
    nav?.pop();
  }

  Future<void> pushSub() async {
    delegate.myNS = MyNavigationState.sub();
    delegate.notify();
  }

  Future<void> pushDoc(DocumentModel doc) async {
    delegate.param['doc'] = doc;
    delegate.myNS = MyNavigationState.doc();
    delegate.notify();
  }

  Future<void> pushSubFromDoc() async {
    delegate.param['sub_doc'] = true;
    delegate.myNS = MyNavigationState.subDoc();
    delegate.notify();
  }
}
