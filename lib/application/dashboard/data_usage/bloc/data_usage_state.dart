import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_failures.dart';

abstract class DataUsageState {
  const DataUsageState();
}

class SuccessState extends DataUsageState {
  DataUsage dataUsage;
  SuccessState(this.dataUsage);
}

class FailedState extends DataUsageState {
  DataUsageFailure dataUsageFailure;
  FailedState(this.dataUsageFailure);
}

class InitialState extends DataUsageState {}
