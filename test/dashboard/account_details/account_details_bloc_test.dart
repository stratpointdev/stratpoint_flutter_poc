import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/application/dashboard/account_details/account_details_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/account_details/account_details_event.dart';
import 'package:globe_one_poc_project/application/dashboard/account_details/account_details_state.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/account_details_repository.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_request_body.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAccountDetailsRepository extends Mock
    implements AccountDetailsRepository {}

void main() {
  AccountDetailsBloc bloc;
  AccountDetailsRepository mockRepository;

  setUp(() {
    mockRepository = MockAccountDetailsRepository();
    bloc = AccountDetailsBloc(mockRepository);
  });

  test(
      'Successful RefreshAccountDetailsEvent should display AccountDetailsSuccessState',
      () {
    final NameInfo nameInfo = NameInfo(0, ' ', 0, ' ', ' ', ' ', ' ', ' ', ' ',
        ' ', ' ', ' ', ' ', ' ', ' ', 0, 0);
    final AccountDetailsRequestBody accountDetailsRequestBody =
        AccountDetailsRequestBody(
            msisdn: '', forceRefresh: false, primaryResourceType: '');
    final SubscriberGeneralInfo subscriberGeneralInfo =
        SubscriberGeneralInfo(primResourceVal: '');
    final SubscriberHeader subscriberHeader =
        SubscriberHeader(nameInfo, subscriberGeneralInfo);
    final DetailsByMsisdnResult detailsByMsisdnResult =
        DetailsByMsisdnResult(subscriberHeader);
    final DetailsByMsisdnResponse detailsByMsisdnResponse =
        DetailsByMsisdnResponse(detailsByMsisdnResult);
    final AccountDetailsModel accountDetailsModel =
        AccountDetailsModel(200, detailsByMsisdnResponse);

    when(mockRepository.getAccountDetails(accountDetailsRequestBody))
        .thenAnswer((_) async => right(accountDetailsModel));

    bloc.add(RefreshAccountDetailsEvent());

    expectLater(
        bloc,
        emitsInOrder(<AccountDetailsState>[
          AccountDetailsInitialState(),
          AccountDetailsSuccessState(
              nameInfo: nameInfo, subscriberGeneralInfo: subscriberGeneralInfo)
        ]));
  });
}
