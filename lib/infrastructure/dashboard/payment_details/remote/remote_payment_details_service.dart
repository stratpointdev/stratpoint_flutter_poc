import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_model.dart';
import 'package:globe_one_poc_project/infrastructure/api.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemotePaymentDetailsService {
  final api = Api();

  Future<Either<PaymentDetailsFailure, PaymentDetailsModel>>
      getPaymentDetails() async {
    final api = Api();
    try {
      final response = await get(api.getOutStandingBalance())
          .timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        SharedPreferences myPrefs = await SharedPreferences.getInstance();
        myPrefs.setString('LastApiCall', DateTime.now().toString());
        var body = jsonDecode(response.body);
        return right(PaymentDetailsModel.fromJson(body));
      } else {
        return left(PaymentDetailsFailure.fromJson(jsonDecode(response.body)));
      }
    } catch (_) {
      return left(PaymentDetailsFailure.localError(''));
    }
  }
}
