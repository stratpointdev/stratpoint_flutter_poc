import 'dart:async';
import 'dart:io';

import 'package:globe_one_poc_project/infrastructure/dashboard/authentication/storage_util.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';

import 'package:sembast/sembast_io.dart';

import 'encryption.dart';

class AppDatabase {
  AppDatabase._();
  //Database _database;
  static final AppDatabase _singleton = AppDatabase._();
  static AppDatabase get instance => _singleton;
  Completer<Database> _dbOpenCompleter;
  Future<Database> get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer<Database>();
      _openDatabase();
    }
    return _dbOpenCompleter.future;
  }

  Future<void> _openDatabase() async {
    final Directory appDocumentDir = await getApplicationDocumentsDirectory();
    final String dbPath = join(appDocumentDir.path, 'globeone.db');
    final SembastCodec codec = getEncryptSembastCodec(password: StorageUtil.getString(StorageUtil.dbPassword));
    final Database database =
        await databaseFactoryIo.openDatabase(dbPath, codec: codec);
    _dbOpenCompleter.complete(database);
  }
}
