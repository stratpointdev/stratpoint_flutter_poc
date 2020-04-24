import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/outstanding_balance.dart';

abstract class PaymentDetailsState {
  const PaymentDetailsState();
}

class PaymentSuccessState extends PaymentDetailsState {
  final OutstandingBalance outstandingBalance;

  const PaymentSuccessState({this.outstandingBalance});
}

class InitialState extends PaymentDetailsState {}
