import 'dart:convert';
import 'package:api_client/api_client.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/models/error.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/models/outstading_balance.dart';


final Spec spec = Spec(
    endpoints: {
      "getOutstandingBalance": post("{{httpUrl}}/account/get-out-standing-balance"),

    },
    parameters: {
      "httpUrl": "https://virtserver.swaggerhub.com/S1723/G1ES-OCSP-API-ALL/1.0.0",

    },
    onSend: (Request request) {
      JsonRequestMiddleware(request);
    },
    onReceive: (Request request, Response response) {

     });

Future<Response> outstandingBalance() {
  return spec.call("getOutstandingBalance", onSend: (Request request) {
    request.headers.putIfAbsent("accept", () => "application/json");
    request.body = {"msisdn": "<string>", "primaryResourceType": "<string>","forceRefresh":"<boolean>"};
  });
}

Future<OutstandingBalance> getOutstandingBalance() async => outstandingBalance().then( (responseOne) {
    if (responseOne.statusCode == 200) {
      var data = json.decode(responseOne.body);
      var rest = data["errors"] as List;
      print(rest);
      List<Err>  res =  rest.map<Err>((json) => Err.fromJson(json)).toList();


    }else{
      throw Exception('error');
  } 

}).catchError((onError){

});






