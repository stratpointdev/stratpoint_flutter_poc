import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_model.dart';
import 'package:globe_one_poc_project/infrastructure/api.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemotePaymentDetailsService {
  final Api api = Api();

  Future<Either<PaymentDetailsFailure, PaymentDetailsModel>>
      getPaymentDetails() async {
    final Api api = Api();
    try {
      final Response response = await get(api.getOutStandingBalance())
          .timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        final SharedPreferences myPrefs = await SharedPreferences.getInstance();
        myPrefs.setString('LastApiCall', DateTime.now().toString());

        final dynamic body = jsonDecode(response.body.toString());
        return right(
            PaymentDetailsModel.fromJson(body as Map<String, dynamic>));
      } else {
        return left(PaymentDetailsFailure.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>));
      }
    } catch (_) {
      return left(PaymentDetailsFailure.localError(''));
    }
  }
}
