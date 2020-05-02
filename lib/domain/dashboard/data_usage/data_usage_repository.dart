import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_failures.dart';

abstract class DataUsageRepository {
  Future<Either<DataUsageFailure, DataUsageModel>> getDataUsage();
  Future insertDataUsageLocal(DataUsageModel);
  Future deleteDataUsageLocal();

}
