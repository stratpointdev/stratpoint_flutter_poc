import 'package:sembast/sembast.dart';

import 'app_database.dart';

mixin databaseFactoryWeb {
  static Future<Database> openDatabase(String dataUsage) {
    return AppDatabase.instance.database;
  }
}
