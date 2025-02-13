part of '../initialize.dart';

Future<Dependencies> $initializeDependencies(
    {Function(int progress, String message)? onProgress,
    bool? isTesting}) async {
  final dependencies = MutableDependencies();
  final totalStaps = _initializationSteps.length;
  var currentStep = 0;
  for (final step in _initializationSteps.entries) {
    currentStep++;
    final percent = (currentStep * 100 ~/ totalStaps).clamp(0, 100);
    onProgress?.call(percent, step.key);
    await step.value(dependencies, isTesting);
    log('initialization: $currentStep/$totalStaps ($percent) | ${step.key}');
  }
  return dependencies.freeze();
}

typedef _InitializationStep = FutureOr<void> Function(
    MutableDependencies dependencies, bool? isT);
final Map<String, _InitializationStep> _initializationSteps =
    <String, _InitializationStep>{
  'Database initialization': (dependencies, isT) async {
    final data = DatabaseRepository();
    final openCount = await data.getOpenCount();
    await data.saveOpenCount(openCount + 1);
    dependencies.context['open_count'] = openCount;
    dependencies.dR = data;
  },
  'Subscription initialization': (dependencies, isT) async {
    final StreamController<int> erroController = StreamController();
    dependencies.context['error'] = erroController;
    BaseSubscriptionRepository sub;
    if (kDebugMode) {
      sub = SubDebugRepository(errorController: erroController);
    } else {
      sub = RevenueCatRepository(errorController: erroController);
    }
    await sub.initilize();
    await sub.loadingProducts();
    if (!kDebugMode) await sub.checkStatus();
    dependencies.context['premium'] = sub.premium;
    dependencies.subR = sub;
  },
  'Scanner initialization': (dependencies, isT) async {
    final StreamController<int> erroController =
        dependencies.context['error'] as StreamController<int>;
    final scanR = DocumentScannerRepository(errorController: erroController);
    await scanR.getSavedDoc();
    dependencies.scanR = scanR;
  },
  'Routing initialization': (dependencies, isT) async {
    await Future.delayed(const Duration(seconds: 1));
    MyRouterDelegate.instance.param['open_count'] =
        dependencies.context['open_count'];
    MyRouterDelegate.instance.param['premium'] =
        dependencies.context['premium'];
  },
};
