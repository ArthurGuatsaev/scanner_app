import 'dart:async';

import 'package:test_work/services/subscription/domain/model/ab_model.dart';
import 'package:test_work/services/subscription/domain/model/product_model.dart';

abstract class BaseSubscriptionRepository with AbModel {
  BaseSubscriptionRepository({required this.errorController});
  final StreamController<int> errorController;
  StreamController<SubStatusInfo> streamSubscription = StreamController();
  List<ProductModel> products = [];
  bool premium = false;
  Future<void> initilize();
  Future<void> loadingProducts();
  Future<void> buyProduct(String id);
  Future<void> restorePurchase();
  Future<void> checkStatus();
  Future<void> close();
}

enum SubStatusInfo {
  success,
  cancel,
  loading,
  noPurchase,
  error,
}
