import 'package:equatable/equatable.dart';
import 'package:globe_one_poc_project/domain/dashboard/common/datetime_converter.dart';
import 'package:globe_one_poc_project/domain/dashboard/common/number_format.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_model.dart';

abstract class PaymentDetailsState extends Equatable {
  const PaymentDetailsState();
  @override
  List<Object> get props => [];
}

class PaymentDetailsInitialState extends PaymentDetailsState {}

class PaymentDetailsLoadingState extends PaymentDetailsState {}

class PaymentDetailsSuccessState extends PaymentDetailsState {
  final String paymentAmountValue;
  final String dueDate;
  final String lastPaymentAmount;
  final String lastPaymentDate;
  final String dateNow;

  const PaymentDetailsSuccessState(
      {this.paymentAmountValue,
      this.dueDate,
      this.lastPaymentAmount,
      this.lastPaymentDate,
      this.dateNow});

  @override
  List<Object> get props => [];

  factory PaymentDetailsSuccessState.paymentDetailsSuccessState(
      {PaymentDetailsModel paymentDetailsModel}) {
    return PaymentDetailsSuccessState(
      paymentAmountValue: NumberConverter.pesoCurrency(double.parse(
          paymentDetailsModel.outstandingBalanceByMsisdnResponse
              .outstandingBalanceByMsisdnResult.overDueBalance)),
      dueDate: DateTimeConverter.convertToDate(paymentDetailsModel
          .outstandingBalanceByMsisdnResponse
          .outstandingBalanceByMsisdnResult
          .overDueDate),
      lastPaymentAmount: NumberConverter.pesoCurrency(paymentDetailsModel
          .outstandingBalanceByMsisdnResponse
          .outstandingBalanceByMsisdnResult
          .lastPaymentDt
          .amount),
      lastPaymentDate: DateTimeConverter.convertToDate(paymentDetailsModel
          .outstandingBalanceByMsisdnResponse
          .outstandingBalanceByMsisdnResult
          .lastPaymentDt
          .paymentDate),
      dateNow: DateTimeConverter.getDateWithYearNow(),
    );
  }
}

class PaymentDetailsFailedState extends PaymentDetailsState {}
