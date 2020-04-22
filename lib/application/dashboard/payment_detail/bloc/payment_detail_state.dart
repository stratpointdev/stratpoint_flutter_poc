


import 'package:globe_one_poc_project/infrastructure/dashboard/models/outstading_balance.dart';


abstract class PaymentDetailState {
  const PaymentDetailState();

}

class PaymentSuccessState extends PaymentDetailState{
  final OutstandingBalance outstandingBalance;

  const PaymentSuccessState({this.outstandingBalance});
}

class InitialState extends PaymentDetailState{}




