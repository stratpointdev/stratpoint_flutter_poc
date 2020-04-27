import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_failures.dart';
import 'package:sembast/sembast.dart';

import '../../../app_database.dart';

class LocalDataUsageService {

  static const String DATA_USAGE = 'dataUsage';
  final _dataUsage = intMapStoreFactory.store(DATA_USAGE);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(DataUsageModel dataUsageModel) async {
    print('insert');
    try {
      await _dataUsage.add(await _db, dataUsageModel.toJson());
    }catch(error){
      print('insert error' +error.toString());
    }
  }

  Future delete() async {
    print('delete');
    await _dataUsage.delete(
      await _db,
    );
  }

  Future<Either<DataUsageFailure, DataUsageModel>> getDataUsage() async {

    try {
      final finder = Finder(limit: 1);
      final recordSnapshots = await _dataUsage.find(
          await _db, finder: finder
      );

      return right(recordSnapshots.map((snapshot) {
        print('getDataUsage '+snapshot.value.toString());
        return DataUsageModel.fromJson(snapshot.value);
      }).single);
    }catch(error){
      print('errorlocal'+error.toString());
      return left(DataUsageFailure.localError(error));
    }
  }


}
