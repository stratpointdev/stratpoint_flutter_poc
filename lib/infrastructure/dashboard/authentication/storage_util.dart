

import 'package:shared_preferences/shared_preferences.dart';


class StorageUtil {
  StorageUtil._();

  static StorageUtil _storageUtil;
  static SharedPreferences _preferences;
  //keys
  static String accessUserNameKey = 'accessUserName';
  static String accessTokenPasswordKey = 'accessTokenPassword';
  static String cmsUserNameKey = 'cmsUserName';
  static String cmsPasswordKey = 'cmsPassword';
  static String dbPasswordKey = 'dbPassword';
  //value
  static String accessUserName  = 'stratpoint';
  static String accessTokenPassword ='KJBRzYM5yA4jHcbd8Zqm74vFWtr7NsDN';
  static String cmsUserName = 'flutterpoc-stratpoint';
  static String dbPassword ='Str@tpo1nt';

  static Future<void> getInstance() async {
    if (_storageUtil == null) {
      // keep local instance till it is fully initialized.
      final StorageUtil secureStorage = StorageUtil._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    StorageUtil.putString(accessUserNameKey, accessUserName);
    StorageUtil.putString(accessTokenPasswordKey, accessTokenPassword);
    StorageUtil.putString(cmsUserNameKey,cmsUserName);
    StorageUtil.putString(cmsPasswordKey, dbPassword);
    StorageUtil.putString(dbPasswordKey, dbPassword);
    return _storageUtil;
  }

  Future<void> _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String getString(String key, {String defValue = ''}) {
    if (_preferences == null)
      return defValue;

    return _preferences.getString(key) ?? defValue;
  }
  static Future<bool> putString(String key, String value) {

    if (_preferences == null)
      return null;

    return _preferences.setString(key, value);
  }


}