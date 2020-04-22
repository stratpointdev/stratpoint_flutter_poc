


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_detail/bloc/payment_detail_event.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_detail/bloc/payment_detail_state.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/api.dart';

class PaymentDetailBloc extends Bloc<PaymentDetailEvent, PaymentDetailState> {

  get initialState => InitialState();

  @override
  Stream<PaymentDetailState> mapEventToState(event) async*{
    // TODO: implement mapEventToState

    if(event is RefreshEvent){
      var value = await getOutstandingBalance();
      yield  PaymentSuccessState(outstandingBalance :value );
    }
  }

}