import 'package:equatable/equatable.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details.dart';


abstract class PaymentDetailsState extends Equatable {
  const PaymentDetailsState();
}

class PaymentSuccessState extends PaymentDetailsState {
  final OutstandingBalance outstandingBalance;

  const PaymentSuccessState({this.outstandingBalance});

  @override
  List<Object> get props => [];
}

class PaymentDetailsInitialState extends PaymentDetailsState {
  @override
  List<Object> get props => [];
}
