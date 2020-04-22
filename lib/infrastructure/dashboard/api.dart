import 'dart:convert';


import 'package:globe_one_poc_project/infrastructure/dashboard/models/outstading_balance.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/models/error.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/sample.dart';
import 'package:http/http.dart' as http;

import 'models/outstading_balance.dart';

String httpUrl = 'https://virtserver.swaggerhub.com/S1723/G1ES-OCSP-API-ALL/1.0.0"';

Future<http.Response> createAlbum(String extention) {
  return http.post( httpUrl+extention,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'msisdn': '<string>',
      'primaryResourceType': '<string>',
      'forceRefresh':'<boolean>'
    }),
  );
}

Future<Err> getErr() async {
 http.Response response = await createAlbum("/account/get-out-standing-balance");
 print(response);
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    var rest = data["errors"] as List;
    print(rest);
    List<Err>  res =  rest.map<Err>((json) => Err.fromJson(json)).toList();
    return res[0];
  }else{
    throw Exception('error');
  }

}


Future<OutstandingBalance> getOutstandingBalance() async {
  print("getLastPayment");
  // http.Response response = await createAlbum("/account/get-out-standing-balance");
  // print(response.body);
  // if (response.statusCode == 200) {
  var data = json.decode(Sample.outstanding);
  var rest = data["outstandingBalanceByMsisdnResponse"];
  var dd = rest["outstandingBalanceByMsisdnResult"];
  print(dd);
  return OutstandingBalance.fromJson(dd);
  //}else{
  //  throw Exception('error');
  //}

}








