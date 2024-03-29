import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_failures.dart';
import 'package:globe_one_poc_project/infrastructure/api.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/authentication/authentication.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteDataUsageService {
  Future<Either<DataUsageFailure, DataUsageModel>> getDataUsage() async {
    final Api api = Api();
    final Authentication authentication = Authentication();
    final String _getAccessToken = await authentication.getAccessToken();
    //Normaly we get this testBody from domain. It is hardcode for now since we have no login.
    const String _testBody = '''
         {
          "serviceNumber": "09270001926",
          "forceRefresh": true,
          "primaryResourceType": "C"
        } 
    ''';
    final Response response = await post(api.getDataUsage(),
            headers: <String, String>{
              'Authorization': '$_getAccessToken',
              'g-channel': 'STRATPOINT'
            },
            body: _testBody)
        .timeout(const Duration(seconds: 60));
    print('CODE: ' + response.statusCode.toString());
    print('BODY: ' + response.body.toString());

    if (response.statusCode == 200) {
      final SharedPreferences myPrefs = await SharedPreferences.getInstance();
      myPrefs.setString('LastApiCall', DateTime.now().toString());
      final dynamic body = jsonDecode(response.body);
      return right(DataUsageModel.fromJson(body as Map<String, dynamic>));
    } else {
      return left(DataUsageFailure.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>));
    }
  }
}
