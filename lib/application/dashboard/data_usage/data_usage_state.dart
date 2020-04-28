import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/common/utils/cup_level_indicator.dart';
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
  final String timeNow;
  final Widget cupLevelIndicator;

  DataUsageSuccessState({this.volumeRemaing,this.totalAllocated,this.endDate,this.timeNow,this.cupLevelIndicator});

  @override
  List<Object> get props => [volumeRemaing,totalAllocated,endDate];

  //function to sum all total allocated and remainingData;
  factory DataUsageSuccessState.dataUsageSuccesState(List<DataUsage> dataUsageList){

    double sumVolumeRemaining = 0.0;
    double sumTotalAllocated = 0.0;
    for(int i = 0 ; i < dataUsageList.length ; i++){
      sumVolumeRemaining =  sumVolumeRemaining + double.parse(dataUsageList[i].volumeRemaining);
      sumTotalAllocated =  sumTotalAllocated + double.parse(dataUsageList[i].totalAllocated);
    }
    var remainingData = GBConverter.convert(sumVolumeRemaining);
    var dataAllocation = GBConverter.convert(sumTotalAllocated);
    var refillDate = DateTimeConverter.convertToDate(dataUsageList[0].endDate);
    var timeNow = DateTimeConverter.getTimeNow();
    var cupLevelIndicator = CupLevelIndicator.cupLevelIndicator(sumVolumeRemaining,sumTotalAllocated);
    return DataUsageSuccessState(volumeRemaing: remainingData, totalAllocated: dataAllocation , endDate: refillDate, timeNow: timeNow,cupLevelIndicator: cupLevelIndicator );
  }
}

class DataUsageFailedState extends DataUsageState {
  final DataUsageFailure dataUsageFailure;
  DataUsageFailedState(this.dataUsageFailure);

  @override
  List<Object> get props => [dataUsageFailure];
}





class DataUsageInitialState extends DataUsageState {}

class DataUsageLoadingState extends DataUsageState {}
