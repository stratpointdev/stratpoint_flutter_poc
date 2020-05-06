import 'dart:wasm';

import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_model.dart';

import 'entities/payment_details_failure.dart';

abstract class PaymentDetailsRepository {
  Future<Either<PaymentDetailsFailure, PaymentDetailsModel>>
      getPaymentDetails();

  Future<Void> insertPaymentDetailsLocal(
      PaymentDetailsModel paymentDetailsModel);
  Future<Void> deletePaymentDetailsLocal();
}
