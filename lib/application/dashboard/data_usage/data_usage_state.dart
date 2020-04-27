import 'package:equatable/equatable.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_failures.dart';

abstract class DataUsageState extends Equatable {
  const DataUsageState();
  @override
  List<Object> get props => [];
}

class DataUsageSuccessState extends DataUsageState {
  final List<DataUsage> dataUsage;
  DataUsageSuccessState(this.dataUsage);

  @override
  List<Object> get props => [dataUsage];
}

class DataUsageFailedState extends DataUsageState {
  final DataUsageFailure dataUsageFailure;
  DataUsageFailedState(this.dataUsageFailure);

  @override
  List<Object> get props => [dataUsageFailure];
}

class DataUsageInitialState extends DataUsageState {}

class DataUsageLoadingState extends DataUsageState {}
