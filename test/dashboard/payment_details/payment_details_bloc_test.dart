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
    LastPaymentDt lastPaymentDt =
        LastPaymentDt(amount: 200.03, paymentDate: '2020-04-23T00:00:00+0800');
    PaymentDetailsModel paymentDetailsModel = PaymentDetailsModel(
        200,
        OutstandingBalanceByMsisdnResponse(OutstandingBalanceByMsisdnResult(
            lastPaymentDt, '2020-03-31T00:00:00+0800', '2000.03', '_')));

    when(mockRepository.getPaymentDetails())
        .thenAnswer((_) async => right(paymentDetailsModel));

    bloc.add(RefreshPaymentDetailsEvent());

    expectLater(
        bloc,
        emitsInOrder(
            [PaymentDetailsInitialState(), PaymentDetailsSuccessState()]));
  });
}
