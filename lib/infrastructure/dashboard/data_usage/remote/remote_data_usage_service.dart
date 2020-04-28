import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_failures.dart';
import 'package:globe_one_poc_project/infrastructure/api.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteDataUsageService {
  Future<Either<DataUsageFailure, DataUsageModel>> getDataUsage() async {
    final api = Api();

    final response = await get(api.getDataUsage());
    if (response.statusCode == 200) {
      SharedPreferences myPrefs = await SharedPreferences.getInstance();
      myPrefs.setString('LastAccountDetailsCall', DateTime.now().toString());
      var body = jsonDecode(response.body);
      return right(DataUsageModel.fromJson(body));
    } else {
      return left(DataUsageFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
