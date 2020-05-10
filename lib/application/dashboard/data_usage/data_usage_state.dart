import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/domain/dashboard/common/cup_level_indicator.dart';
import 'package:globe_one_poc_project/domain/dashboard/common/datetime_converter.dart';
import 'package:globe_one_poc_project/domain/dashboard/common/gb_converter.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_failures.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_model.dart';

abstract class DataUsageState extends Equatable {
  const DataUsageState();
  @override
  List<Object> get props => <Object>[];
}

class DataUsageSuccessState extends DataUsageState {
  const DataUsageSuccessState(
      {this.remainingData,
      this.dataAllocation,
      this.refillDate,
      this.cupLevelIndicator,
      this.lastAPICall});

  factory DataUsageSuccessState.success({MainData mainData}) {
    return DataUsageSuccessState(
        remainingData: GBConverter.convert(mainData.dataRemaining as int),
        dataAllocation: GBConverter.convert(mainData.dataTotal as int),
        refillDate: DateTimeConverter.convertToDate(mainData.endDate),
        cupLevelIndicator: CupLevelIndicator.cupLevel(
            double.parse(mainData.dataRemaining.toString()),
            double.parse(mainData.dataTotal.toString())),
        lastAPICall: DateTimeConverter.getTimeNow());
  }

  final String remainingData;
  final String dataAllocation;
  final String refillDate;
  final Image cupLevelIndicator;
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
