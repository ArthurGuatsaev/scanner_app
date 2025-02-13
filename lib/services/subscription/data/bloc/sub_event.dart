part of 'sub_bloc.dart';

sealed class SubEvent {}

class PressBuyProduct extends SubEvent {
  final ProductModel? product;
  PressBuyProduct({required this.product});
}

class PressProductActive extends SubEvent {
  final ProductModel? product;
  PressProductActive({required this.product});
}

class PressRestorePurchase extends SubEvent {}

class PressPurchase extends SubEvent {}

class CheckSubStatus extends SubEvent {}

class RecieveNewStatus extends SubEvent {
  final SubStatusInfo event;

  RecieveNewStatus({required this.event});
}
