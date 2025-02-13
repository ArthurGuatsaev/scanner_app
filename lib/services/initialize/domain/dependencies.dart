part of '../initialize.dart';

abstract interface class Dependencies {
  abstract final BaseSubscriptionRepository subR;
  abstract final BaseScannerRepository scanR;
  abstract final DatabaseRepository dR;
  final Map<String, Object> context = {};
}

class MutableDependencies implements Dependencies {
  @override
  final Map<String, Object> context = {};
  @override
  late BaseSubscriptionRepository subR;
  @override
  late BaseScannerRepository scanR;
  @override
  late DatabaseRepository dR;

  Dependencies freeze() => UnmutableDependencies(
        subR: subR,
        scanR: scanR,
        dR: dR,
        context: context,
      );
}

final class UnmutableDependencies implements Dependencies {
  @override
  final BaseSubscriptionRepository subR;
  @override
  final BaseScannerRepository scanR;
  @override
  final DatabaseRepository dR;
  @override
  final Map<String, Object> context;
  const UnmutableDependencies({
    required this.subR,
    required this.scanR,
    required this.dR,
    required this.context,
  });
}

class InheritedDependencies extends InheritedWidget {
  final Dependencies dependencies;
  const InheritedDependencies({
    required super.child,
    super.key,
    required this.dependencies,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static Dependencies of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<InheritedDependencies>()!
      .dependencies;
}
