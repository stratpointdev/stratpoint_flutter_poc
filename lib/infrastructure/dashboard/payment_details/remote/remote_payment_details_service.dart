import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_model.dart';
import 'package:globe_one_poc_project/infrastructure/api.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/authentication/authentication.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemotePaymentDetailsService {
  final Api api = Api();

  Future<Either<PaymentDetailsFailure, PaymentDetailsModel>>
      getPaymentDetails() async {
    final Authentication authentication = Authentication();
    final String _getAccessToken = await authentication.getAccessToken();

    const String _testBody = '''
          {
          "msisdn": "09270001926",
          "forceRefresh": true,
          "primaryResourceType": "C"
          }
    ''';
    final Response response = await post(api.getOutStandingBalance(),
            headers: <String, String>{
              'Authorization': '$_getAccessToken',
              'g-channel': 'STRATPOINT'
            },
            body: _testBody)
        .timeout(const Duration(seconds: 60));
    print('CODE: ' + response.statusCode.toString());
    print('BODY: ' + response.body.toString());

    print(response.statusCode);
    if (response.statusCode == 200) {
      final SharedPreferences myPrefs = await SharedPreferences.getInstance();
      myPrefs.setString('LastApiCall', DateTime.now().toString());
      print('RESPONSE CODE: $response');
      final dynamic body = jsonDecode(response.body.toString());
      return right(PaymentDetailsModel.fromJson(body as Map<dynamic, dynamic>));
    } else {
      return left(PaymentDetailsFailure.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>));
    }
  }
}
