import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/payment_details_repository.dart';

import 'payment_details_event.dart';
import 'payment_details_state.dart';

class PaymentDetailsBloc
    extends Bloc<PaymentDetailsEvent, PaymentDetailsState> {
  final PaymentDetailsRepository paymentDetailsRepository;

  PaymentDetailsBloc(this.paymentDetailsRepository)
      : assert(paymentDetailsRepository != null);

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
          await paymentDetailsRepository.getPaymentDetails();
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
