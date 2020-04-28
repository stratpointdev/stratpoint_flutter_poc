import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_failures.dart';
import 'package:globe_one_poc_project/infrastructure/api.dart';

class RemoteDataUsageService {
  final api = Api();

  Future<Either<DataUsageFailure, DataUsageModel>> getDataUsage() async {
    final jsonResponse = await api.getJsonResponse(api.getDataUsage());

    if (jsonResponse == null) {
      return left(DataUsageFailure());
    }

    return right(DataUsageModel.fromJson(jsonResponse));
  }
}
