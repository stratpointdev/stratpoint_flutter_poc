


import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/bloc/data_usage_event.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/bloc/data_usage_state.dart';
import 'package:globe_one_poc_project/common/utils/kb_converter.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/data_usage_repository.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage.dart';

class DataUsageBloc extends Bloc<DataUsageEvent, DataUsageState> {


  final DataUsageRepository repository;
  DataUsageBloc(this.repository);

  get initialState => InitialState();

  @override
  Stream<DataUsageState> mapEventToState(event) async*{
    // TODO: implement mapEventToState

    if(event is RefreshEvent){
      var value = await repository.getDataUsage();
      if(value.isRight()) {
        DataUsage dataUsage = value.getOrElse(() => null);
        
        yield SuccessState(
            remainingData: KBConverter.convert( double.parse(dataUsage.volumeRemaining ) ),
            totalData: KBConverter.convert( double.parse( dataUsage.totalAllocated ) ),
            refillDate: dataUsage.endDate
        );
      }
    }
  }

}