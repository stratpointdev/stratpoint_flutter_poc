import 'dart:convert';

import 'package:globe_one_poc_project/infrastructure/api.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/authentication/secure_storage_util.dart';
import 'package:http/http.dart';

class Authentication {
  final Api api = Api();

  Future<String> getAccessToken() async {
    final String username =
        await SecureStorageUtil.getString(SecureStorageUtil.accessUserNameKey);
    final String password = await SecureStorageUtil.getString(
        SecureStorageUtil.accessTokenPasswordKey);

    final String _testAccount =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
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
