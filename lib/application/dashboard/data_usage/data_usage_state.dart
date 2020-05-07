import 'package:equatable/equatable.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_failures.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_model.dart';

abstract class DataUsageState extends Equatable {
  const DataUsageState();
  @override
  List<Object> get props => <Object>[];
}

class DataUsageSuccessState extends DataUsageState {
  const DataUsageSuccessState({this.mainData, this.lastAPICall});
  final MainData mainData;
  final String lastAPICall;

  @override
  List<Object> get props => <Object>[];
}

class DataUsageFailedState extends DataUsageState {
  const DataUsageFailedState(this.dataUsageFailure);

  final DataUsageFailure dataUsageFailure;

  @override
  List<Object> get props => <Object>[dataUsageFailure];
}

class DataUsageInitialState extends DataUsageState {}

class DataUsageLoadingState extends DataUsageState {}
