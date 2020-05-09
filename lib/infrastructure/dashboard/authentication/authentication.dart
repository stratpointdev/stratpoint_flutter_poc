import 'dart:convert';

import 'package:globe_one_poc_project/infrastructure/api.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/authentication/storage_util.dart';
import 'package:http/http.dart';
class Authentication {
  final Api api = Api();

  Future<String> getAccessToken() async {
    //Usually we get this credentials as inputs, since we have no login. This is just a test account.
    final String username = StorageUtil.getString(StorageUtil.accessUserNameKey);
    final String password = StorageUtil.getString(StorageUtil.accessTokenPasswordKey);
    final String _testAccount = 'Basic ' +
        base64Encode(
            utf8.encode('$username:$password'));
    final Response response = await post(api.getAccessToken(),
        headers: <String, String>{
          'Authorization': _testAccount,
          'g-channel': 'STRATPOINT'
        }).timeout(const Duration(seconds: 30));
    if (response.statusCode == 200) {
      final dynamic body = jsonDecode(response.body);
      return body['access_token'] as String;
    } else {
      return 'invalid credentials';
    }
  }


}
