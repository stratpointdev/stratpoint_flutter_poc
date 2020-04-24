import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_details/bloc/payment_details_event.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_details/bloc/payment_details_state.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/payment_details_repository.dart';

class PaymentDetailBloc extends Bloc<PaymentDetailsEvent, PaymentDetailsState> {
  final PaymentDetailsRepository repository;

  PaymentDetailBloc(this.repository);

  get initialState => InitialState();

  @override
  Stream<PaymentDetailsState> mapEventToState(event) async* {
    // TODO: implement mapEventToState

    if (event is RefreshEvent) {
      var value = await repository.getOutstandingBalance();
      if (value.isRight()) {
        yield PaymentSuccessState(outstandingBalance: value.getOrElse(null));
      }
    }
  }
}
