import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/data_usage_repository.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_failures.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/data_usage/local/local_data_usage_service.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/data_usage/remote/remote_data_usage_service.dart';

class DataUsageRepositoryImpl implements DataUsageRepository {
  final RemoteDataUsageService remoteDataUsageService;
  final LocalDataUsageService localDataUsageService;

  DataUsageRepositoryImpl(
      this.remoteDataUsageService, this.localDataUsageService);

  @override
  Future<Either<DataUsageFailure, DataUsageModel>> getDataUsage({isLocal}) {

   if(isLocal) {
     return localDataUsageService.getDataUsage().then((value) {
       if (value.isLeft()) {
         return remoteDataUsageService.getDataUsage();
       }else {
         return localDataUsageService.getDataUsage();
       }
     });
   }else {
     return remoteDataUsageService.getDataUsage();
   }

  }

  @override
  Future deleteDataUsageLocal() {
    return localDataUsageService.delete();
  }

  @override
  Future insertDataUsageLocal(dateUsageModel) {
    return localDataUsageService.insert(dateUsageModel);
  }

}
