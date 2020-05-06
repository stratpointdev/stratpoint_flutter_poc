import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/domain/dashboard/common/cup_level_indicator.dart';
import 'package:globe_one_poc_project/domain/dashboard/common/datetime_converter.dart';
import 'package:globe_one_poc_project/domain/dashboard/common/gb_converter.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_failures.dart';

abstract class DataUsageState extends Equatable {
  const DataUsageState();
  @override
  List<Object> get props => <Object>[];
}

class DataUsageSuccessState extends DataUsageState {
  const DataUsageSuccessState({
    this.volumeRemaing,
    this.totalAllocated,
    this.endDate,
    this.lastApiCall,
    this.cupLevelIndicator,
  });

  //function to sum all total allocated and remainingData;
  factory DataUsageSuccessState.dataUsageSuccesState(
      List<DataUsage> dataUsageList) {
    double sumVolumeRemaining = 0.0;
    double sumTotalAllocated = 0.0;
    for (int i = 0; i < dataUsageList.length; i++) {
      sumVolumeRemaining =
          sumVolumeRemaining + double.parse(dataUsageList[i].volumeRemaining);
      sumTotalAllocated =
          sumTotalAllocated + double.parse(dataUsageList[i].totalAllocated);
    }
    final String remainingData = GBConverter.convert(sumVolumeRemaining);
    final String dataAllocation = GBConverter.convert(sumTotalAllocated);
    final String refillDate =
        DateTimeConverter.convertToDate(dataUsageList[0].endDate);
    final String lastApiCall = DateTimeConverter.getTimeNow();
    final Widget cupLevelIndicator = CupLevelIndicator.cupLevelIndicator(
        sumVolumeRemaining, sumTotalAllocated);
    return DataUsageSuccessState(
        volumeRemaing: remainingData,
        totalAllocated: dataAllocation,
        endDate: refillDate,
        lastApiCall: lastApiCall,
        cupLevelIndicator: cupLevelIndicator);
  }

  final String volumeRemaing;
  final String totalAllocated;
  final String endDate;
  final String lastApiCall;
  final Widget cupLevelIndicator;

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
