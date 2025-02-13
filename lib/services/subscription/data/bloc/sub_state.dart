// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sub_bloc.dart';

class SubState {
  final List<ProductModel> products;
  final ProductModel? activeProduct;
  final SubStatusInfo status;
  final bool haveSub;
  SubState({
    this.activeProduct,
    this.products = const [],
    this.status = SubStatusInfo.noPurchase,
    required this.haveSub,
  });

  SubState copyWith({
    List<ProductModel>? products,
    SubStatusInfo? status,
    ProductModel? activeProduct,
    bool? haveSub,
  }) {
    return SubState(
      products: products ?? this.products,
      status: status ?? this.status,
      haveSub: haveSub ?? this.haveSub,
      activeProduct: activeProduct ?? this.activeProduct,
    );
  }

  bool get isSubscribed => status == SubStatusInfo.success;
  bool get isLoading => status == SubStatusInfo.loading;
}
