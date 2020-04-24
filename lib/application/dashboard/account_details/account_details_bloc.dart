import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/account_details_repository.dart';

import 'account_details_event.dart';
import 'account_details_state.dart';

class AccountDetailsBloc
    extends Bloc<AccountDetailsEvent, AccountDetailsState> {
  final AccountDetailsRepository accountDetailsRepository;

  AccountDetailsBloc(this.accountDetailsRepository);

  @override
  AccountDetailsState get initialState => AccountDetailsInitial();

  @override
  Stream<AccountDetailsState> mapEventToState(
      AccountDetailsEvent event) async* {
    if (event is RefreshAccountDetailsEvent) {
      yield AccountDetailsLoading();
      final result = await accountDetailsRepository.getAccountDetails();
      yield result.fold(
          (failures) => AccountDetailsFailed(),
          (success_entity) => AccountDetailsSuccess(
              nameInfo: success_entity.detailsByMsisdnResponse
                  .detailsByMsisdnResult.subscriberHeader.nameInfo));
    }
  }
}
