import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/domain/dashboard/common/datetime_converter.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/payment_details_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      SharedPreferences myPrefs = await SharedPreferences.getInstance();
      var lastAPICallDate = DateTimeConverter.convertToComparable(
          myPrefs.getString('LastAccountDetailsCall'));
      int minutes = DateTime.now().difference(lastAPICallDate).inMinutes;
      bool isLocal = true;
      if (minutes >= 1) {
        isLocal = false;
      }
      var value =
          await paymentDetailsRepository.getPaymentDetails(isLocal: isLocal);

      yield value.fold(
          (failures) => PaymentDetailsFailedState(),
          (success_entity) =>
              PaymentDetailsSuccessState(paymentDetailsModel: success_entity));
      if (value.isRight()) {
        await paymentDetailsRepository.deletePaymentDetailsLocal();
        await paymentDetailsRepository
            .insertPaymentDetailsLocal(value.getOrElse(() => null));
      }
    }

    if (event is RefreshPaymentDetailsEvent) {
      yield PaymentDetailsLoadingState();
      var result =
          await paymentDetailsRepository.getPaymentDetails(isLocal: false);
      yield result.fold(
          (failures) => PaymentDetailsFailedState(),
          (success_entity) =>
              PaymentDetailsSuccessState(paymentDetailsModel: success_entity));
      if (result.isRight()) {
        await paymentDetailsRepository.deletePaymentDetailsLocal();
        await paymentDetailsRepository
            .insertPaymentDetailsLocal(result.getOrElse(() => null));
      }
    }
  }
}
