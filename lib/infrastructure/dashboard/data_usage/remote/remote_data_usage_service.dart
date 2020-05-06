import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_failures.dart';
import 'package:globe_one_poc_project/infrastructure/api.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteDataUsageService {
  Future<Either<DataUsageFailure, DataUsageModel>> getDataUsage() async {
    final Api api = Api();

    try {
      final Response response =
          await get(api.getDataUsage()).timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        final SharedPreferences myPrefs = await SharedPreferences.getInstance();
        myPrefs.setString('LastApiCall', DateTime.now().toString());
        final dynamic body = jsonDecode(response.body);
        return right(DataUsageModel.fromJson(body as Map<String, dynamic>));
      } else {
        return left(DataUsageFailure.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>));
      }
    } catch (_) {
      return left(DataUsageFailure.localError(''));
    }
  }
}
