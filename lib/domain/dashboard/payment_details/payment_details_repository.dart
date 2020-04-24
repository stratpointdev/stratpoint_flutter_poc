import 'package:dartz/dartz.dart';

import 'entities/payment_details.dart';
import 'entities/payment_details_failure.dart';

abstract class PaymentDetailsRepository {
  Future<Either<PaymentDetailsFailure, OutstandingBalance>>
      getOutstandingBalance();
}
