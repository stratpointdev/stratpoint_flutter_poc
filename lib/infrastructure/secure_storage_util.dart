import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageUtil {
  SecureStorageUtil._();

  static SecureStorageUtil _secureStorageUtil;
  static FlutterSecureStorage _storage;

  //keys
  static String accessUserNameKey = 'accessUserName';
  static String accessTokenPasswordKey = 'accessTokenPassword';
  static String cmsUserNameKey = 'cmsUserName';
  static String cmsPasswordKey = 'cmsPassword';
  static String dbPasswordKey = 'dbPassword';
  //value
  static String accessUserName = 'stratpoint';
  static String accessTokenPassword = 'KJBRzYM5yA4jHcbd8Zqm74vFWtr7NsDN';
  static String cmsUserName = 'flutterpoc-stratpoint';
  static String dbPassword = 'Str@tpo1nt';

  static Future<void> getInstance() async {
    if (_secureStorageUtil == null) {
      final SecureStorageUtil secureStorage = SecureStorageUtil._();
      await secureStorage._init();
      _secureStorageUtil = secureStorage;
    }
    SecureStorageUtil.putString(accessUserNameKey, accessUserName);
    SecureStorageUtil.putString(accessTokenPasswordKey, accessTokenPassword);
    SecureStorageUtil.putString(cmsUserNameKey, cmsUserName);
    SecureStorageUtil.putString(cmsPasswordKey, dbPassword);
    SecureStorageUtil.putString(dbPasswordKey, dbPassword);

    return _secureStorageUtil;
  }

  Future<void> _init() async {
    _storage = const FlutterSecureStorage();
  }

  static Future<String> getString(String key, {String defValue = ''}) async {
    if (_storage == null) {
      return defValue;
    }

    return await _storage.read(key: key);
  }

  static Future<void> putString(String key, String value) async {
    if (_storage == null) {
      return;
    }
    return await _storage.write(key: key, value: value);
  }
}
