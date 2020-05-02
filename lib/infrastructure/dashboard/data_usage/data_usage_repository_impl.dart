import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/common/datetime_converter.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/data_usage_repository.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_failures.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/data_usage/local/local_data_usage_service.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/data_usage/remote/remote_data_usage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataUsageRepositoryImpl implements DataUsageRepository {
  final RemoteDataUsageService remoteDataUsageService;
  final LocalDataUsageService localDataUsageService;

  DataUsageRepositoryImpl(
      this.remoteDataUsageService, this.localDataUsageService);

  @override
  Future<Either<DataUsageFailure, DataUsageModel>> getDataUsage() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    int secs = DateTimeConverter.getSecsDiff(myPrefs.getString('LastApiCall'));
    if (secs <= 5) {
      return localDataUsageService.getDataUsage();
    } else {
      return remoteDataUsageService.getDataUsage().then((value) {
        if (value.isLeft()) {
          return localDataUsageService.getDataUsage();
        } else {
          return value;
        }
      });
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
