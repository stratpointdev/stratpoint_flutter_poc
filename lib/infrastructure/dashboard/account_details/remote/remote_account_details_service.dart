import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_failures.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_model.dart';
import 'package:globe_one_poc_project/infrastructure/api.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteAccountDetailsService {
  final api = Api();

  Future<Either<AccountDetailsFailures, AccountDetailsModel>>
      getAccountDetails() async {
    try {
      final response = await get(api.getSubscriberDetails())
          .timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        final SharedPreferences myPrefs = await SharedPreferences.getInstance();
        myPrefs.setString('LastApiCall', DateTime.now().toString());
        final body = jsonDecode(response.body);
        return right(AccountDetailsModel.fromJson(body));
      } else {
        return left(AccountDetailsFailures.fromJson(jsonDecode(response.body)));
      }
    } catch (_) {
      return left(AccountDetailsFailures.localError(''));
    }
  }
}
