import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_event.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_state.dart';
import 'package:globe_one_poc_project/domain/dashboard/common/datetime_converter.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/data_usage_repository.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_failures.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_request_body.dart';

class DataUsageBloc extends Bloc<DataUsageEvent, DataUsageState> {
  DataUsageBloc(this.dataUsageRepository);

  final DataUsageRepository dataUsageRepository;

  @override
  DataUsageInitialState get initialState => DataUsageInitialState();

  @override
  Stream<DataUsageState> mapEventToState(DataUsageEvent event) async* {
    if (event is InitialDataUsageEvent) {
      yield DataUsageLoadingState();
    }
    if (event is RefreshDataUsageEvent || event is InitialDataUsageEvent) {
      final Either<DataUsageFailure, DataUsageModel> value =
          await dataUsageRepository.getDataUsage(DataUsageRequestBody(
              serviceNumber: '09270001926',
              forceRefresh: true,
              primaryResourceType: 'C'));

      yield value.fold(
          (DataUsageFailure failed) => DataUsageFailedState(failed),
          (DataUsageModel succuessEntity) => DataUsageSuccessState(
              mainData: succuessEntity.promoSubscriptionUsage.mainData[0],
              lastAPICall: DateTimeConverter.getTimeNow()));

      if (value.isRight()) {
        await dataUsageRepository.deleteDataUsageLocal();
        await dataUsageRepository
            .insertDataUsageLocal(value.getOrElse(() => null));
      }
    }
  }
}
