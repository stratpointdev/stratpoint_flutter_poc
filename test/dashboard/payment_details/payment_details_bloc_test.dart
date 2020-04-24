import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_event.dart';
import 'package:globe_one_poc_project/application/dashboard/payment_details/payment_details_state.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details.dart';
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
    OutstandingBalance balance = OutstandingBalance(
        accountBalance: AccountBalance(), lastPayment: LastPayment());

    when(mockRepository.getOutstandingBalance())
        .thenAnswer((_) async => right(balance));

    bloc.add(RefreshEvent());

    expectLater(bloc,
        emitsInOrder([PaymentDetailsInitialState(), PaymentSuccessState()]));
  });
}
