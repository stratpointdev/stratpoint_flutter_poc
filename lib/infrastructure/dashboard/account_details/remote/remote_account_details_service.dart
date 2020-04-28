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
    final response = await get(api.getSubscriberDetails());
    if (response.statusCode == 200) {
      SharedPreferences myPrefs = await SharedPreferences.getInstance();
      myPrefs.setString('LastAccountDetailsCall', DateTime.now().toString());
      var body = jsonDecode(response.body);
      return right(AccountDetailsModel.fromJson(body));
    } else {
      return left(AccountDetailsFailures.fromJson(jsonDecode(response.body)));
    }
  }
}
