import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_failures.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/data_usage/remote/sample.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RemoteDataUsageService {
  String baseUrl =
      'https://virtserver.swaggerhub.com/S1723/G1ES-OCSP-API-ALL/1.0.0';

  Future<http.Response> ApiClient(String extenstion) {
    return http.post(
      baseUrl + extenstion,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'msisdn': '<string>',
        'primaryResourceType': '<string>',
        'forceRefresh': '<boolean>'
      }),
    );
  }

  Future<Either<DataUsageFailure, DataUsageModel>> getDataUsage() async {
    // http.Response response = await createAlbum("/account/get-out-standing-balance");
    // print(response.body);
    // if (response.statusCode == 200) {
    var data = jsonDecode(Sample.retrieveSubcriberUsage);
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString('LastAccountDetailsCall', DateTime.now().toString());
    print('getDataUsage');

    print('getDataUsage' + DataUsageModel.fromJson(data).toJson().toString());
    return right(DataUsageModel.fromJson(data));
    //}else{
    //  throw Exception('error');
    //}
  }
}
