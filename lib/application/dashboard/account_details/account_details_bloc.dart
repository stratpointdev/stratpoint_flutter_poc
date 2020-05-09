import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/account_details_repository.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_failures.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_request_body.dart';

import 'account_details_event.dart';
import 'account_details_state.dart';

class AccountDetailsBloc
    extends Bloc<AccountDetailsEvent, AccountDetailsState> {
  AccountDetailsBloc(this.accountDetailsRepository);
  final AccountDetailsRepository accountDetailsRepository;
  @override
  AccountDetailsState get initialState => AccountDetailsInitialState();

  @override
  Stream<AccountDetailsState> mapEventToState(
      AccountDetailsEvent event) async* {
    if (event is InitialAccountDetailsEvent) {
      yield AccountDetailsLoadingState();
    }

    if (event is RefreshAccountDetailsEvent ||
        event is InitialAccountDetailsEvent) {
      final Either<AccountDetailsFailures, AccountDetailsModel> result =
          await accountDetailsRepository.getAccountDetails(
              AccountDetailsRequestBody(
                  msisdn: '09270001926',
                  forceRefresh: true,
                  primaryResourceType: 'C'));

      yield result.fold(
          (AccountDetailsFailures failures) => AccountDetailsFailedState(),
          (AccountDetailsModel successEntity) => AccountDetailsSuccessState(
              nameInfo: successEntity.detailsByMsisdnResponse
                  .detailsByMsisdnResult.subscriberHeader.nameInfo,
              subscriberGeneralInfo: successEntity
                  .detailsByMsisdnResponse
                  .detailsByMsisdnResult
                  .subscriberHeader
                  .subscriberGeneralInfo));

      if (result.isRight()) {
        await accountDetailsRepository.deletePaymentDetailsLocal();
        await accountDetailsRepository
            .insertPaymentDetailsLocal(result.getOrElse(() => null));
      }
    }
  }
}
