import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/outstanding_balance.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_failure.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/payment_details/remote/sample.dart';
import 'package:http/http.dart' as http;

class RemotePaymentDetailsService {
  String httpUrl =
      'https://virtserver.swaggerhub.com/S1723/G1ES-OCSP-API-ALL/1.0.0"';

  Future<http.Response> createAlbum(String extention) {
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

  Future<PaymentDetailsFailure> getErr() async {
    http.Response response =
        await createAlbum("/account/get-out-standing-balance");
    print(response);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var rest = data["errors"] as List;
      print(rest);
      List<PaymentDetailsFailure> res = rest
          .map<PaymentDetailsFailure>(
              (json) => PaymentDetailsFailure.fromJson(json))
          .toList();
      return res[0];
    } else {
      throw Exception('error');
    }
  }

  Future<Either<PaymentDetailsFailure, OutstandingBalance>>
      getOutstandingBalance() async {
    print("getLastPayment");
    // http.Response response = await createAlbum("/account/get-out-standing-balance");
    // print(response.body);
    // if (response.statusCode == 200) {
    var data = json.decode(Sample.outstanding);
    var rest = data["outstandingBalanceByMsisdnResponse"];
    var dd = rest["outstandingBalanceByMsisdnResult"];
    print(dd);
    return right(OutstandingBalance.fromJson(dd));
    //}else{
    //  throw Exception('error');
    //}
  }
}
