import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_model.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_event.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_state.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/payment_details_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockPaymentDetailsRepository extends Mock
    implements PaymentDetailsRepository {}

void main() {
  PaymentDetailsBloc bloc;
  PaymentDetailsRepository mockRepository;

  setUp(() {
    mockRepository = MockPaymentDetailsRepository();
    bloc = PaymentDetailsBloc(mockRepository);
  });

  test('Successful RefreshEvent should display PaymentSuccessState', () {
    LastPaymentDt lastPaymentDt = LastPaymentDt();
    PaymentDetailsModel paymentDetailsModel = PaymentDetailsModel(
        200,
        OutstandingBalanceByMsisdnResponse(
            OutstandingBalanceByMsisdnResult(lastPaymentDt, '_', '_', ' ')));

    when(mockRepository.getPaymentDetails(isLocal: false))
        .thenAnswer((_) async => right(paymentDetailsModel));

    bloc.add(RefreshPaymentDetailsEvent());

    expectLater(
        bloc,
        emitsInOrder([
          PaymentDetailsInitialState(),
          PaymentDetailsLoadingState(),
          PaymentDetailsSuccessState()
        ]));
  });
}
