import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:globe_one_poc_project/domain/dashboard/payment_details/payment_details_repository.dart';

import 'payment_details_event.dart';
import 'payment_details_state.dart';

class PaymentDetailsBloc
    extends Bloc<PaymentDetailsEvent, PaymentDetailsState> {
  final PaymentDetailsRepository repository;

  PaymentDetailsBloc(this.repository) : assert(repository != null);

  @override
  PaymentDetailsState get initialState => PaymentDetailsInitialState();

  @override
  Stream<PaymentDetailsState> mapEventToState(
      PaymentDetailsEvent event) async* {
    // TODO: implement mapEventToState

    if (event is RefreshEvent) {
      var value = await repository.getOutstandingBalance();
      if (value.isRight()) {
        yield PaymentSuccessState(outstandingBalance: value.getOrElse(null));
      }
    }
  }
}
