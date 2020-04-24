import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_failures.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/data_usage/remote/sample.dart';

import 'package:http/http.dart' as http;

class RemoteDataUsageService {

  String httpUrl =
      'https://virtserver.swaggerhub.com/S1723/G1ES-OCSP-API-ALL/1.0.0';

  Future<http.Response> ApiClient(String extention) {
    return http.post(
      httpUrl + extention,
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

  Future<Either<DataUsageFailure, DataUsage>>
      getDataUsage() async {
    // http.Response response = await createAlbum("/account/get-out-standing-balance");
    // print(response.body);
    // if (response.statusCode == 200) {
    var data = json.decode(Sample.retrieveSubcriberUsage);
    var rest = data["retrieveSubscriberUsageResult"];
    var dd = rest["buckets"];
    var da = dd["buckets"] as List;
    print(da[0].toString());
    return right(DataUsage.fromJson(da[0]));
    //}else{
    //  throw Exception('error');
    //}
  }


}
