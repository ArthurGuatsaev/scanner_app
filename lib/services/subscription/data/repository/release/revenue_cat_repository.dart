import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:test_work/services/subscription/domain/model/product_model.dart';
import 'package:test_work/services/subscription/domain/repository/base_subscription_repository.dart';

class RevenueCatRepository extends BaseSubscriptionRepository {
  RevenueCatRepository({required super.errorController});
  List<Package> storeProduct = [];

  @override
  Future<void> buyProduct(String id) async {
    final pocket =
        storeProduct.where((e) => e.storeProduct.identifier == id).firstOrNull;
    if (pocket == null) return;
    await Purchases.purchasePackage(pocket);
  }

  @override
  Future<void> checkStatus() async {
    try {
      CustomerInfo customerInfo = await Purchases.getCustomerInfo();
      if (customerInfo.entitlements.active.isNotEmpty) {
        premium = true;
        streamSubscription.add(SubStatusInfo.success);
        return;
      }
      premium = false;
      streamSubscription.add(SubStatusInfo.noPurchase);
    } catch (e) {
      premium = false;
      streamSubscription.add(SubStatusInfo.error);
      errorController.add(222);
    }
  }

  @override
  Future<void> initilize() async {
    await Purchases.setLogLevel(LogLevel.debug);
    final configuration = PurchasesConfiguration('');
    await Purchases.configure(configuration);
    Purchases.addCustomerInfoUpdateListener((_) => checkStatus());
  }

  @override
  Future<void> loadingProducts() async {
    final offering = await Purchases.getOfferings();
    if (offering.current?.availablePackages.isEmpty ?? true) return;
    final weekly = offering.current?.weekly;
    final yearly = offering.current?.annual;
    abValue['paywall'] =
        offering.current?.getMetadataString('paywall', 'a') ?? 'a';
    if (weekly != null) storeProduct.add(weekly);
    if (yearly != null) storeProduct.add(yearly);
    for (var i in storeProduct) {
      final pr = ProductModel.fromQPr(i.storeProduct);
      if (pr != null) products.add(pr);
    }
  }

  @override
  Future<void> restorePurchase() async {
    await Purchases.restorePurchases();
  }

  @override
  Future<void> close() async {
    Purchases.removeCustomerInfoUpdateListener((_) {});
  }
}
