part of '../router.dart';

class MyRouterDelegate extends RouterDelegate<MyNavigationState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyNavigationState> {
  static MyRouterDelegate instance = MyRouterDelegate._();
  Map<String, Object?> param = {};
  MyNavigationState? myNS;
  @override
  final GlobalKey<NavigatorState> navigatorKey =
      MyNavigatorManager.instance.key;
  MyRouterDelegate._();
  @override
  Widget build(BuildContext context) {
    final doc = param['doc'] as DocumentModel?;
    return Navigator(
      key: navigatorKey,
      pages: [
        if (myNS == null) const MaterialPage(child: Scaffold()),
        if (myNS?.board == true)
          const MaterialPage(child: BoardPage(), name: 'board'),
        if (myNS?.home == true)
          const MaterialPage(child: HomePage(), name: 'home'),
        if (myNS?.doc == true)
          MaterialPage(child: DocPage(doc: doc), name: 'doc'),
        if (myNS?.sub == true)
          const MaterialPage(
              child: SubscriptionPage(), name: 'sub', fullscreenDialog: true),
      ],
      onPopPage: onPop,
    );
  }

  @override
  MyNavigationState? get currentConfiguration => myNS;
  @override
  Future<void> setNewRoutePath(MyNavigationState configuration) async {
    myNS = configuration;
    notifyListeners();
  }

  @override
  Future<void> setInitialRoutePath(MyNavigationState configuration) async {
    final openCount = param['open_count'] as int?;
    final premium = param['premium'] as bool?;
    switch ((openCount, premium)) {
      case (1, _):
        myNS = MyNavigationState.board();
      case (_, true):
        myNS = MyNavigationState.home();
      default:
        myNS = MyNavigationState.sub();
    }
    notifyListeners();
  }

  bool onPop(Route<dynamic> route, dynamic result) {
    if (param['sub_doc'] == true) {
      myNS = MyNavigationState.doc();
      notifyListeners();
      param['sub_doc'] = false;
      return false;
    }
    switch (route.settings.name) {
      case 'sub':
      case 'doc':
        myNS = MyNavigationState.home();
        notifyListeners();
    }
    return false;
  }

  void notify() => notifyListeners();

  bool get isSubOpen => myNS?.sub == true || myNS?.subDoc == true;
}
