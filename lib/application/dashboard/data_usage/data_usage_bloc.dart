


import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_event.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_state.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/data_usage_repository.dart';

class DataUsageBloc extends Bloc<DataUsageEvent, DataUsageState> {


  final DataUsageRepository repository;
  DataUsageBloc(this.repository);

  get initialState => InitialState();

  @override
  Stream<DataUsageState> mapEventToState(event) async*{
    // TODO: implement mapEventToState

    if(event is RefreshDataUsageEvent){
      yield DataUsageLoadingState();

      var value = await repository.getDataUsage();
      if(value.isRight()) {
        if(await repository.checkDataUsageLocalById(value.getOrElse( () => null ) )) {
          await repository.insertDataUsageLocal(value.getOrElse( () => null ) );
        } else {
          await repository.updateDataUsageLocal(value.getOrElse( () => null ) );
        }
      }
           yield value.fold((dataUsageFailure) => DataUsageFailedState(dataUsageFailure),
                   (dataUsage) => DataUsageSuccessState(dataUsage));
         }

      }
    }



