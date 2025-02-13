import 'package:test_work/services/subscription/domain/model/product_model.dart';
import 'package:test_work/services/subscription/domain/repository/base_subscription_repository.dart';

class SubDebugRepository extends BaseSubscriptionRepository {
  SubDebugRepository({required super.errorController});

  @override
  Future<void> buyProduct(String id) async {
    await Future.delayed(const Duration(seconds: 2));
    await checkStatus();
  }

  @override
  Future<void> checkStatus() async {
    try {
      premium = true;
      streamSubscription.add(SubStatusInfo.success);
    } catch (e) {
      premium = false;
      streamSubscription.add(SubStatusInfo.error);
    }
  }

  @override
  Future<void> initilize() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> loadingProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    products = [
      ProductModel(
          id: 'some_id',
          code: '\$',
          description: '',
          period: 'week',
          introductoryPrice: '\$250',
          periodCount: 1,
          price: 0,
          prettyPrice: '\$0',
          sale: 50,
          trialPeriod: '3'),
      ProductModel(
        id: 'some_id_year',
        code: '\$',
        description: '',
        period: 'year',
        periodCount: 1,
        price: 39.99,
        prettyPrice: '\$39.99',
      ),
    ];
  }

  @override
  Future<void> restorePurchase() async {
    await Future.delayed(const Duration(seconds: 2));
    await checkStatus();
  }

  @override
  Future<void> close() async {}
}
