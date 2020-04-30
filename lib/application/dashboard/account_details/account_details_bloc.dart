import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/account_details_repository.dart';
import 'package:globe_one_poc_project/domain/dashboard/common/datetime_converter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'account_details_event.dart';
import 'account_details_state.dart';

class AccountDetailsBloc
    extends Bloc<AccountDetailsEvent, AccountDetailsState> {
  final AccountDetailsRepository accountDetailsRepository;

  AccountDetailsBloc(this.accountDetailsRepository);

  @override
  AccountDetailsState get initialState => AccountDetailsInitialState();

  @override
  Stream<AccountDetailsState> mapEventToState(
      AccountDetailsEvent event) async* {
    if (event is InitialAccountDetailsEvent) {
      yield AccountDetailsLoadingState();
       SharedPreferences myPrefs = await SharedPreferences.getInstance();
       var lastAPICallDate = DateTimeConverter.convertToComparable(
           myPrefs.getString('LastAccountDetailsCall'));
       int minutes = DateTime.now().difference(lastAPICallDate).inMinutes;
      bool isLocal = true;
       if (minutes >= 15) {
         isLocal = false;
       }
      var value =
          await accountDetailsRepository.getAccountDetails(isLocal: isLocal);

      yield value.fold(
          (failures) => AccountDetailsFailedState(),
          (success_entity) => AccountDetailsSuccessState(
              nameInfo: success_entity.detailsByMsisdnResponse
                  .detailsByMsisdnResult.subscriberHeader.nameInfo));

      if (value.isRight()) {
        await accountDetailsRepository.deletePaymentDetailsLocal();
        await accountDetailsRepository
            .insertPaymentDetailsLocal(value.getOrElse(() => null));
      }
    }

    if (event is RefreshAccountDetailsEvent) {
      yield AccountDetailsLoadingState();
      final result =
          await accountDetailsRepository.getAccountDetails(isLocal: false);

      yield result.fold(
          (failures) => AccountDetailsFailedState(),
          (success_entity) => AccountDetailsSuccessState(
              nameInfo: success_entity.detailsByMsisdnResponse
                  .detailsByMsisdnResult.subscriberHeader.nameInfo));

      if (result.isRight()) {
        await accountDetailsRepository.deletePaymentDetailsLocal();
        await accountDetailsRepository
            .insertPaymentDetailsLocal(result.getOrElse(() => null));
      }
    }
  }
}
