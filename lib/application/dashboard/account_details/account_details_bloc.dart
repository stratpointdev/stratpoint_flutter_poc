import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/account_details_repository.dart';

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


    if(event is InitialAccountDetailsEvent){
      yield AccountDetailsLoadingState();
      var value = await accountDetailsRepository.getAccountDetails(isLocal: true);
      yield value.fold(
              (failures) => AccountDetailsFailedState(),
              (success_entity) => AccountDetailsSuccessState(nameInfo: success_entity.detailsByMsisdnResponse
                  .detailsByMsisdnResult.subscriberHeader.nameInfo));

      if (value.isRight()) {
        await accountDetailsRepository.deletePaymentDetailsLocal();
        await accountDetailsRepository.insertPaymentDetailsLocal(value.getOrElse(() => null));
      }
    }

    if (event is RefreshAccountDetailsEvent) {
      yield AccountDetailsLoadingState();
      final result = await accountDetailsRepository.getAccountDetails(isLocal: false);

      yield result.fold(
          (failures) => AccountDetailsFailedState(),
          (success_entity) => AccountDetailsSuccessState(
              nameInfo: success_entity.detailsByMsisdnResponse
                  .detailsByMsisdnResult.subscriberHeader.nameInfo));

      if (result.isRight()) {
        await accountDetailsRepository.deletePaymentDetailsLocal();
        await accountDetailsRepository.insertPaymentDetailsLocal(result.getOrElse(() => null));
      }
    }
  }
}
