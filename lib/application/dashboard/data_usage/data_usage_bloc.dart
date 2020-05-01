import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_event.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_state.dart';
import 'package:globe_one_poc_project/domain/dashboard/common/datetime_converter.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/data_usage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataUsageBloc extends Bloc<DataUsageEvent, DataUsageState> {
  final DataUsageRepository dataUsageRepository;
  DataUsageBloc(this.dataUsageRepository);

  get initialState => DataUsageInitialState();

  @override
  Stream<DataUsageState> mapEventToState(event) async* {
    if (event is InitialDataUsageEvent) {
      yield DataUsageLoadingState();
      SharedPreferences myPrefs = await SharedPreferences.getInstance();
      var lastAPICallDate = DateTimeConverter.convertToComparable(
          myPrefs.getString('LastAccountDetailsCall'));
      int minutes = DateTime.now().difference(lastAPICallDate).inMinutes;

      var value = await dataUsageRepository.getDataUsage();
      yield value.fold(
          (failed) => DataUsageFailedState(failed),
          (succuess_entity) => DataUsageSuccessState.dataUsageSuccesState(
              succuess_entity
                  .retrieveSubscriberUsageResult.buckets.dataUsageList));

      if (value.isRight() && minutes >= 5) {
        await dataUsageRepository.deleteDataUsageLocal();
        await dataUsageRepository
            .insertDataUsageLocal(value.getOrElse(() => null));
      }
    }

    if (event is RefreshDataUsageEvent) {
      yield DataUsageLoadingState();

      var value = await dataUsageRepository.getDataUsage();

      yield value.fold(
          (failed) => DataUsageFailedState(failed),
          (succuess_entity) => DataUsageSuccessState.dataUsageSuccesState(
              succuess_entity
                  .retrieveSubscriberUsageResult.buckets.dataUsageList));

      if (value.isRight()) {
        await dataUsageRepository.deleteDataUsageLocal();
        await dataUsageRepository
            .insertDataUsageLocal(value.getOrElse(() => null));
      }
    }
  }
}
