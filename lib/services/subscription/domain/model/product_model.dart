import 'package:purchases_flutter/object_wrappers.dart';

class ProductModel {
  final String? id;
  final String? period;
  final double? price;
  final int? periodCount;
  final String? description;
  final String? prettyPrice;
  final String? trialPeriod;
  final String? introductoryPrice;
  final String? code;
  final int? sale;
  final StoreProduct? storeProduct;
  ProductModel(
      {this.id,
      this.trialPeriod,
      this.sale,
      this.introductoryPrice,
      this.code,
      this.prettyPrice,
      this.period,
      this.price,
      this.storeProduct,
      this.periodCount,
      this.description});

  static ProductModel? fromQPr(StoreProduct? qProduct) {
    if (qProduct == null) return null;
    return ProductModel(
        description: qProduct.description,
        id: qProduct.identifier,
        code: qProduct.currencyCode,
        period: qProduct.subscriptionPeriod,
        price: qProduct.price,
        introductoryPrice: qProduct.introductoryPrice?.priceString,
        prettyPrice: qProduct.priceString,
        trialPeriod: qProduct.introductoryPrice?.period);
  }

  ProductModel copyWith({
    String? id,
    String? period,
    double? price,
    int? periodCount,
    String? description,
    String? prettyPrice,
    String? trialPeriod,
    int? sale,
  }) {
    return ProductModel(
      id: id ?? this.id,
      period: period ?? this.period,
      price: price ?? this.price,
      periodCount: periodCount ?? this.periodCount,
      description: description ?? this.description,
      prettyPrice: prettyPrice ?? this.prettyPrice,
      trialPeriod: trialPeriod ?? this.trialPeriod,
      sale: sale ?? this.sale,
    );
  }
}
