import 'package:bloc/bloc.dart';
import 'package:test_work/services/subscription/domain/model/product_model.dart';
import 'package:test_work/services/subscription/domain/repository/base_subscription_repository.dart';

part 'sub_event.dart';
part 'sub_state.dart';

class SubBloc extends Bloc<SubEvent, SubState> {
  final BaseSubscriptionRepository subR;
  SubBloc({required this.subR})
      : super(SubState(
            haveSub: subR.premium,
            activeProduct: subR.products.firstOrNull,
            products: subR.products)) {
    subR.streamSubscription.stream
        .listen((event) => add(RecieveNewStatus(event: event)));

    on<PressBuyProduct>(buyProduct);
    on<RecieveNewStatus>(recieveStatus);
    on<PressProductActive>(pressProduct);
    on<PressRestorePurchase>(pressRestore);
    on<CheckSubStatus>(checkSubStatus); // to do
  }

  buyProduct(PressBuyProduct event, Emitter<SubState> emit) async {
    if (event.product?.id == null) return;
    emit(state.copyWith(status: SubStatusInfo.loading));
    await subR.buyProduct(event.product!.id!);
  }

  pressRestore(PressRestorePurchase event, Emitter<SubState> emit) async {
    emit(state.copyWith(status: SubStatusInfo.loading));
    await subR.restorePurchase();
  }

  pressProduct(PressProductActive event, Emitter<SubState> emit) async {
    emit(state.copyWith(activeProduct: event.product));
  }

  recieveStatus(RecieveNewStatus event, Emitter<SubState> emit) async {
    switch (event.event) {
      case SubStatusInfo.success:
        emit(state.copyWith(haveSub: true, status: SubStatusInfo.success));
      default:
        emit(state.copyWith(haveSub: false, status: SubStatusInfo.noPurchase));
    }
  }

  checkSubStatus(CheckSubStatus event, Emitter<SubState> emit) async {}
}
