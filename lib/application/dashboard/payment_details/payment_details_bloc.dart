import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_request_body.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/payment_details_repository.dart';

import 'payment_details_event.dart';
import 'payment_details_state.dart';

class PaymentDetailsBloc
    extends Bloc<PaymentDetailsEvent, PaymentDetailsState> {
  PaymentDetailsBloc(this.paymentDetailsRepository)
      : assert(paymentDetailsRepository != null);
  final PaymentDetailsRepository paymentDetailsRepository;

  @override
  PaymentDetailsState get initialState => PaymentDetailsInitialState();

  @override
  Stream<PaymentDetailsState> mapEventToState(
      PaymentDetailsEvent event) async* {
    if (event is InitialPaymentDetailsEvent) {
      yield PaymentDetailsLoadingState();
    }
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
