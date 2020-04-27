import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_failures.dart';

abstract class DataUsageRepository {
  // isLocal - true will get local data 1st before remote
  Future<Either<DataUsageFailure, DataUsageModel>> getDataUsage({bool isLocal});
  Future insertDataUsageLocal(DataUsageModel);
  Future deleteDataUsageLocal();

}
