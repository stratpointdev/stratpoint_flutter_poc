import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_model.dart';

import 'entities/payment_details_failure.dart';

abstract class PaymentDetailsRepository {
  // isLocal - true will get local data 1st before remote
  Future<Either<PaymentDetailsFailure, PaymentDetailsModel>>
      getPaymentDetails({bool isLocal});

  Future insertPaymentDetailsLocal(PaymentDetailsModel);
  Future deletePaymentDetailsLocal();

}
