import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/data_usage_repository.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_failures.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/data_usage/local/local_data_usage_service.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/data_usage/remote/remote_data_usage_service.dart';

class DataUsageRepositoryImpl implements DataUsageRepository {
  final RemoteDataUsageService remoteService;
  final LocalDataUsageService localService;

  DataUsageRepositoryImpl(
      this.remoteService, this.localService);

  @override
  Future<Either<DataUsageFailure, DataUsage>> getDataUsage() {
    // TODO: implement getDataUsage
    return remoteService.getDataUsage();
  }

}
