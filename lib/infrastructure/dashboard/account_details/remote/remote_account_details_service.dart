import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_failures.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_request_body.dart';
import 'package:globe_one_poc_project/infrastructure/api.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/authentication/authentication.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteAccountDetailsService {
  final Api api = Api();

  Future<Either<AccountDetailsFailures, AccountDetailsModel>> getAccountDetails(
      AccountDetailsRequestBody accountDetailsRequestBody) async {
    final Authentication authentication = Authentication();
    final String _getAccessToken = await authentication.getAccessToken();

    final Response response = await post(api.getSubscriberDetails(),
            headers: <String, String>{
              'Authorization': '$_getAccessToken',
              'g-channel': 'STRATPOINT'
            },
            body: jsonEncode(accountDetailsRequestBody))
        .timeout(const Duration(seconds: 60));

    if (response.statusCode == 200) {
      final SharedPreferences myPrefs = await SharedPreferences.getInstance();
      myPrefs.setString('LastApiCall', DateTime.now().toString());
      final dynamic body = jsonDecode(response.body);

      return right(AccountDetailsModel.fromJson(body as Map<dynamic, dynamic>));
    } else {
      return left(AccountDetailsFailures.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>));
    }
  }
}
