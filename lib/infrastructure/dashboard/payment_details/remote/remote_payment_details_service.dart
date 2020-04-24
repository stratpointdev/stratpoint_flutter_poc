import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_model.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/payment_details/remote/payment_details_response.dart';

class RemotePaymentDetailsService {
  String baseUrl =
      'https://virtserver.swaggerhub.com/S1723/G1ES-OCSP-API-ALL/1.0.0"';

  Future<Either<PaymentDetailsFailure, PaymentDetailsModel>>
      getPaymentDetails() async {
    bool isSuccess = true;
    await Future.delayed(Duration(seconds: 2));
    if (isSuccess) {
      var body = jsonDecode(PaymentDetailsResponse.body);
      return right(PaymentDetailsModel.fromJson(body));
    } else {
      return left(PaymentDetailsFailure());
    }
  }
}
