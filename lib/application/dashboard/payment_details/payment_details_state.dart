import 'package:equatable/equatable.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_model.dart';

abstract class PaymentDetailsState extends Equatable {
  const PaymentDetailsState();
  @override
  List<Object> get props => [];
}

class PaymentDetailsInitialState extends PaymentDetailsState {}

class PaymentDetailsLoadingState extends PaymentDetailsState {}

class PaymentDetailsSuccessState extends PaymentDetailsState {
  final PaymentDetailsModel paymentDetailsModel;

  const PaymentDetailsSuccessState({this.paymentDetailsModel});

  @override
  List<Object> get props => [];
}

class PaymentDetailsFailedState extends PaymentDetailsState {}
