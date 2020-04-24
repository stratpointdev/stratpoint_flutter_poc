import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_failures.dart';
import 'package:sembast/sembast.dart';

import '../../../app_database.dart';

class LocalDataUsageService {

  static const String DATA_USAGE = 'dataUsage';
  final _dataUsage = intMapStoreFactory.store(DATA_USAGE);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(DataUsage dataUsage) async {
    await _dataUsage.add(await _db, dataUsage.toMap());
  }

  Future update(DataUsage dataUsage) async {

    final finder = Finder(filter: Filter.equals('bucketId' ,dataUsage.bucketId ));
    await _dataUsage.update(
      await _db,
      dataUsage.toMap(),
      finder: finder,
    );
  }

  Future delete(DataUsage dataUsage) async {
    final finder = Finder(filter: Filter.equals('bucketId' ,dataUsage.bucketId ));
    await _dataUsage.delete(
      await _db,
      finder: finder,
    );
  }

  Future<Either<DataUsageFailure, DataUsage>> getDataUsage() async {
    final finder = Finder(limit: 1);
    final recordSnapshots = await _dataUsage.find(
      await _db, finder: finder
    );

    return right(recordSnapshots.map((snapshot) {
      return DataUsage.fromMap(snapshot.value);
    }).single);
  }

  Future<bool> checkDataUsageById(DataUsage dataUsage) async {
    try {
      final finder = Finder( filter: Filter.equals('bucketId' ,dataUsage.bucketId ), limit: 1 );
      final recordSnapshots = await _dataUsage.find(
          await _db, finder: finder
      );

      return recordSnapshots.map( (snapshot) {
        return DataUsage.fromMap( snapshot.value );
      } ).single != null;
    }catch(error){
      return false;
    }
  }
}
