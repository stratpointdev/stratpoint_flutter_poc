import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/authentication/secrets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorageUtil {
  SecureStorageUtil();

  SecureStorageUtil._();

  static SecureStorageUtil _secureStorageUtil;
  //For mobile we used FlutterSecureStorage
  static FlutterSecureStorage _storage;
  //For web we used SharedPreferences
  static SharedPreferences _preferences;
  //keys
  static String accessUserNameKey = 'accessUserName';
  static String accessTokenPasswordKey = 'accessTokenPassword';
  static String cmsUserNameKey = 'cmsUserName';
  static String cmsPasswordKey = 'cmsPassword';
  static String aemUrlKey = 'aemUrl';
  static String dbPasswordKey = 'dbPassword';

  Future<void> getInstance(bool isWeb) async {
    final Secret secrets = await load();
    if (_secureStorageUtil == null) {
      final SecureStorageUtil secureStorage = SecureStorageUtil._();

      await secureStorage._init(isWeb);

      _secureStorageUtil = secureStorage;
    }
    SecureStorageUtil.putString(
        accessUserNameKey, secrets.accessUserName.toString());
    SecureStorageUtil.putString(
        accessTokenPasswordKey, secrets.accessTokenPassword.toString());
    SecureStorageUtil.putString(cmsUserNameKey, secrets.cmsUserName.toString());
    SecureStorageUtil.putString(cmsPasswordKey, secrets.cmsPassword.toString());
    SecureStorageUtil.putString(aemUrlKey, secrets.aemUrl.toString());
    SecureStorageUtil.putString(dbPasswordKey, secrets.dbPassword.toString());

    return _secureStorageUtil;
  }

  Future<Secret> load() async =>
      rootBundle.loadStructuredData<Secret>('assets/secrets.json',
          (String jsonStr) async {
        return Secret.fromJson(json.decode(jsonStr) as Map<String, dynamic>);
      });

  Future<void> _init(bool isWeb) async {
    if (isWeb) {
      _preferences = await SharedPreferences.getInstance();
    } else {
      _storage = const FlutterSecureStorage();
    }
  }

  static Future<String> getString(String key) async {
    if (_storage != null) {
      return await _storage.read(key: key);
    } else {
      return _preferences.getString(key);
    }
  }

  static Future<void> putString(String key, String value) async {
    if (_storage != null) {
      return await _storage.write(key: key, value: value);
    } else {
      return _preferences.setString(key, value);
    }
  }
}
