import 'package:equatable/equatable.dart';
import 'package:globe_one_poc_project/domain/dashboard/common/datetime_converter.dart';
import 'package:globe_one_poc_project/domain/dashboard/common/number_format.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_model.dart';

abstract class PaymentDetailsState extends Equatable {
  const PaymentDetailsState();
  @override
  List<Object> get props => <Object>[];
}

class PaymentDetailsInitialState extends PaymentDetailsState {}

class PaymentDetailsLoadingState extends PaymentDetailsState {}

class PaymentDetailsSuccessState extends PaymentDetailsState {
  const PaymentDetailsSuccessState(
      {this.paymentAmountValue,
      this.dueDate,
      this.lastPaymentAmount,
      this.lastPaymentDate,
      this.dateNow});

  factory PaymentDetailsSuccessState.paymentDetailsSuccessState(
      {PaymentDetailsModel paymentDetailsModel}) {
    return PaymentDetailsSuccessState(
      paymentAmountValue: NumberConverter.pesoCurrency(double.parse(
          paymentDetailsModel.outstandingBalanceByMsisdnResponse
              .outstandingBalanceByMsisdnResult.overDueBalance)),
      dueDate: DateTimeConverter.convertOverDueDateToDueDate(paymentDetailsModel
          .outstandingBalanceByMsisdnResponse
          .outstandingBalanceByMsisdnResult
          .overDueDate),
      lastPaymentAmount: NumberConverter.pesoCurrency(double.parse(
          paymentDetailsModel.outstandingBalanceByMsisdnResponse
              .outstandingBalanceByMsisdnResult.lastPaymentDt.amount)),
      lastPaymentDate: DateTimeConverter.convertToDateWithYear(
          paymentDetailsModel.outstandingBalanceByMsisdnResponse
              .outstandingBalanceByMsisdnResult.lastPaymentDt.paymentDate),
      dateNow: DateTimeConverter.getDateWithYearNow(),
    );
  }

  final String paymentAmountValue;
  final String dueDate;
  final String lastPaymentAmount;
  final String lastPaymentDate;
  final String dateNow;

  @override
  List<Object> get props => <Object>[];
}

class PaymentDetailsFailedState extends PaymentDetailsState {}
