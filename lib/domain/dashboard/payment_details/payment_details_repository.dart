import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/models/outstanding_balance.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/models/payment_details_failure.dart';

abstract class PaymentDetailsRepository {
  Future<Either<PaymentDetailsFailure, OutstandingBalance>>
      getOutstandingBalance();
}
