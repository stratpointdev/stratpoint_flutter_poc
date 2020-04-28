
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_event.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_state.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/data_usage_repository.dart';

class DataUsageBloc extends Bloc<DataUsageEvent, DataUsageState> {
  final DataUsageRepository dataUsageRepository;
  DataUsageBloc(this.dataUsageRepository);

  get initialState  =>  DataUsageInitialState();

  @override
  Stream<DataUsageState> mapEventToState(event) async* {
    // TODO: implement mapEventToState

    if(event is InitialDataUsageEvent){
      yield DataUsageLoadingState();
      var value = await dataUsageRepository.getDataUsage(isLocal: true);
      yield value.fold(
              (failed) => DataUsageFailedState(failed),
              (succuess_entity) => DataUsageSuccessState.dataUsageSuccesState(succuess_entity.retrieveSubscriberUsageResult.buckets.dataUsageList));

      if (value.isRight()) {
        await dataUsageRepository.deleteDataUsageLocal();
        await dataUsageRepository.insertDataUsageLocal(value.getOrElse(() => null));
      }
    }

    if (event is RefreshDataUsageEvent) {
      yield DataUsageLoadingState();

      var value = await dataUsageRepository.getDataUsage(isLocal: false);

      yield value.fold(
          (failed) => DataUsageFailedState(failed),
          (succuess_entity) =>DataUsageSuccessState.dataUsageSuccesState(succuess_entity.retrieveSubscriberUsageResult.buckets.dataUsageList));

      if (value.isRight()) {
        await dataUsageRepository.deleteDataUsageLocal();
        await dataUsageRepository.insertDataUsageLocal(value.getOrElse(() => null));
      }

    }
  }


}
