import 'package:sembast/sembast.dart';

import 'app_database.dart';

class databaseFactoryWeb{
  static Future<Database> openDatabase(String data_usage) {
    return  AppDatabase.instance.database;
  }

}