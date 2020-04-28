import 'dart:convert';
import 'dart:io';

class Api {
  final HttpClient _httpClient = HttpClient();
  String _baseUrl = 'globe-one-poc.free.beeceptor.com';

  Uri getSubscriberDetails() {
    var path = "/postpaid/v1/account/subscriber-details";
    return Uri.https(_baseUrl, path);
  }

  Uri getOutStandingBalance() {
    var path = "/postpaid/v1/account/outstanding-balance";
    return Uri.https(_baseUrl, path);
  }

  Future<Map<String, dynamic>> getJsonResponse(Uri uri) async {
    try {
      final httpRequest = await _httpClient.getUrl(uri);
      final httpResponse = await httpRequest.close();

      if (httpResponse.statusCode != HttpStatus.ok) {
        return null;
      }

      final responseBody = await httpResponse.transform(utf8.decoder).join();
      return json.decode(responseBody);
    } on Exception catch (e) {
      print('$e');
      return null;
    }
  }
}
