import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';

import 'package:sembast/sembast_io.dart';

import 'encryption.dart';

class AppDatabase {
  static final AppDatabase _singleton = AppDatabase._();
  static AppDatabase get instance => _singleton;
  Completer<Database> _dbOpenCompleter;
  AppDatabase._();
  //Database _database;

  Future<Database> get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      _openDatabase();
    }
    return _dbOpenCompleter.future;
  }

  Future _openDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, 'globeone.db');

    var codec = getEncryptSembastCodec(password: 'Str@tpo1nt');
    final database = await databaseFactoryIo.openDatabase(dbPath, codec: codec);
    _dbOpenCompleter.complete(database);
  }
}
