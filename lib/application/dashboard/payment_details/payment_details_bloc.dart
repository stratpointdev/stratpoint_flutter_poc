import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_request_body.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/payment_details_repository.dart';

import 'payment_details_event.dart';
import 'payment_details_state.dart';

//State management that handle Payment Details Module(both presentation and domain layer)
class PaymentDetailsBloc
    extends Bloc<PaymentDetailsEvent, PaymentDetailsState> {
  PaymentDetailsBloc(this.paymentDetailsRepository)
      : assert(paymentDetailsRepository != null);
  final PaymentDetailsRepository paymentDetailsRepository;

  // the state before any events have been processed
  @override
  PaymentDetailsState get initialState => PaymentDetailsInitialState();

  // is called whenever an event related to PaymentDetails is added
  @override
  Stream<PaymentDetailsState> mapEventToState(
      PaymentDetailsEvent event) async* {

  // event that first converted into a loading state(which represent as a circularProgressDialog in presentation layer)
    if (event is InitialPaymentDetailsEvent) {
      yield PaymentDetailsLoadingState();
    }

    // event that get PaymentDetails in domain layer then converted into a state( Success or Failed)
    if (event is RefreshPaymentDetailsEvent ||
        event is InitialPaymentDetailsEvent) {
      final Either<PaymentDetailsFailure, PaymentDetailsModel> result =
          await paymentDetailsRepository.getPaymentDetails(
              PaymentDetailsRequestBody(
                  msisdn: '09270001926',
                  forceRefresh: true,
                  primaryResourceType: 'C'));
      print('IS RIGHT $result');
      yield result.fold(
          (PaymentDetailsFailure failures) => PaymentDetailsFailedState(),
          (PaymentDetailsModel successEntity) =>
              PaymentDetailsSuccessState.paymentDetailsSuccessState(
                  paymentDetailsModel: successEntity));
      if (result.isRight()) {
        await paymentDetailsRepository.deletePaymentDetailsLocal();
        await paymentDetailsRepository
            .insertPaymentDetailsLocal(result.getOrElse(() => null));
      }
    }
  }
}
