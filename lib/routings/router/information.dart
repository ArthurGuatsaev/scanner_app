part of '../router.dart';

class MyRouterInformationParser
    extends RouteInformationParser<MyNavigationState> {
  @override
  Future<MyNavigationState> parseRouteInformation(
      RouteInformation routeInformation) async {
    final url = routeInformation.uri;
    if (url.pathSegments.isEmpty) {
      return MyNavigationState.home();
    }

    switch (url.pathSegments[0]) {
      case 'home':
        return MyNavigationState.home();
      case 'board':
        return MyNavigationState.board();
      case 'sub':
        return MyNavigationState.sub();
      default:
        return MyNavigationState.home();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(MyNavigationState configuration) {
    if (configuration.home) {
      return RouteInformation(
        uri: Uri.parse('/home'),
      );
    }
    if (configuration.board) {
      return RouteInformation(
        uri: Uri.parse('/board'),
      );
    }
    if (configuration.sub) {
      return RouteInformation(
        uri: Uri.parse('/sub'),
      );
    }
    return RouteInformation(uri: Uri.parse('/home'));
  }
}
