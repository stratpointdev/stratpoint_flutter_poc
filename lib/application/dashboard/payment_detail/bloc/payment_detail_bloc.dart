import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_detail/bloc/payment_detail_event.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_detail/bloc/payment_detail_state.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/payment_details_repository.dart';

class PaymentDetailBloc extends Bloc<PaymentDetailEvent, PaymentDetailState> {
  final PaymentDetailsRepository repository;

  PaymentDetailBloc(this.repository);

  get initialState => InitialState();

  @override
  Stream<PaymentDetailState> mapEventToState(event) async* {
    // TODO: implement mapEventToState

    if (event is RefreshEvent) {
      var value = await repository.getOutstandingBalance();
      yield PaymentSuccessState(outstandingBalance: value);
    }
  }
}
