import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_request_body.dart';
import 'package:globe_one_poc_project/infrastructure/api.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/authentication/authentication.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemotePaymentDetailsService {
  final Api api = Api();

  Future<Either<PaymentDetailsFailure, PaymentDetailsModel>> getPaymentDetails(
      PaymentDetailsRequestBody paymentDetailsRequestBody) async {
    final Authentication authentication = Authentication();
    final String _getAccessToken = await authentication.getAccessToken();

    final Response response = await post(api.getOutStandingBalance(),
            headers: <String, String>{
              'Authorization': '$_getAccessToken',
              'g-channel': 'STRATPOINT'
            },
            body: jsonEncode(paymentDetailsRequestBody))
        .timeout(const Duration(seconds: 60));

    print(response.statusCode);
    if (response.statusCode == 200) {
      final SharedPreferences myPrefs = await SharedPreferences.getInstance();
      myPrefs.setString('LastApiCall', DateTime.now().toString());
      final dynamic body = jsonDecode(response.body.toString());
      return right(PaymentDetailsModel.fromJson(body as Map<dynamic, dynamic>));
    } else {
      return left(PaymentDetailsFailure.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>));
    }
  }
}
