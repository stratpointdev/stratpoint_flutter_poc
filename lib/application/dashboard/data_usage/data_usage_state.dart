import 'package:equatable/equatable.dart';
import 'package:globe_one_poc_project/common/utils/datetime_converter.dart';
import 'package:globe_one_poc_project/common/utils/gb_converter.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_failures.dart';

abstract class DataUsageState extends Equatable {
  const DataUsageState();
  @override
  List<Object> get props => [];
}

class DataUsageSuccessState extends DataUsageState {

  final String volumeRemaing;
  final String totalAllocated;
  final String endDate;

  DataUsageSuccessState({this.volumeRemaing,this.totalAllocated,this.endDate});

  @override
  List<Object> get props => [volumeRemaing,totalAllocated,endDate];
}

class DataUsageFailedState extends DataUsageState {
  final DataUsageFailure dataUsageFailure;
  DataUsageFailedState(this.dataUsageFailure);

  @override
  List<Object> get props => [dataUsageFailure];
}
//function to sum all total allocated and remainingData;
DataUsageSuccessState dataUsageSuccesState(List<DataUsage> dataUsageList){

  double sumVolumeRemaining = 0.0;
  double sumTotalAllocated = 0.0;
  for(int i = 0 ; i < dataUsageList.length ; i++){
    sumVolumeRemaining =  sumVolumeRemaining + double.parse(dataUsageList[i].volumeRemaining);
    sumTotalAllocated =  sumTotalAllocated + double.parse(dataUsageList[i].totalAllocated);
  }
  var remainingData = GBConverter.convert(sumVolumeRemaining);
  var dataAllocation = GBConverter.convert(sumTotalAllocated);
  var refillDate = DateTimeConverter.convertToDate(dataUsageList[0].endDate);
  return DataUsageSuccessState(volumeRemaing: remainingData, totalAllocated: dataAllocation , endDate: refillDate );
}

class DataUsageInitialState extends DataUsageState {}

class DataUsageLoadingState extends DataUsageState {}
