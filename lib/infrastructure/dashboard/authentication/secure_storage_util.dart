import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorageUtil {
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
  //value
  static String accessUserName = 'stratpoint';
  static String accessTokenPassword = 'KJBRzYM5yA4jHcbd8Zqm74vFWtr7NsDN';
  static String cmsUserName = 'flutterpoc-stratpoint';
  static String cmsPassword = 'Str@tp01nt';
  static String aemUrl = 'https://contentdev.globe.com.ph';
  static String dbPassword = 'P@55w0rd';

  static Future<void> getInstance(bool isWeb) async {
    if (_secureStorageUtil == null) {
      final SecureStorageUtil secureStorage = SecureStorageUtil._();

      await secureStorage._init(isWeb);

      _secureStorageUtil = secureStorage;
    }
    SecureStorageUtil.putString(accessUserNameKey, accessUserName);
    SecureStorageUtil.putString(accessTokenPasswordKey, accessTokenPassword);
    SecureStorageUtil.putString(cmsUserNameKey, cmsUserName);
    SecureStorageUtil.putString(cmsPasswordKey, cmsPassword);
    SecureStorageUtil.putString(aemUrlKey, aemUrl);
    SecureStorageUtil.putString(dbPasswordKey, dbPassword);

    return _secureStorageUtil;
  }

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
