import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_model.dart';
import 'package:globe_one_poc_project/infrastructure/api.dart';

class RemotePaymentDetailsService {
  final api = Api();

  Future<Either<PaymentDetailsFailure, PaymentDetailsModel>>
      getPaymentDetails() async {
    final jsonResponse = await api.getJsonResponse(api.getOutStandingBalance());

    if (jsonResponse == null) {
      return left(PaymentDetailsFailure());
    }

    return right(PaymentDetailsModel.fromJson(jsonResponse));
  }
}
