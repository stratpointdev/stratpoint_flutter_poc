import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_failures.dart';

abstract class DataUsageRepository {
  Future<Either<DataUsageFailure, DataUsage>> getDataUsage();
}
