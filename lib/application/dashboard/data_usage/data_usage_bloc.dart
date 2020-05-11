import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_event.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_state.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/data_usage_repository.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_failures.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_request_body.dart';


//State management that handle Data Usage Module(both presentation and domain layer)
class DataUsageBloc extends Bloc<DataUsageEvent, DataUsageState> {
  DataUsageBloc(this.dataUsageRepository);

  final DataUsageRepository dataUsageRepository;

  // the state before any events have been processed
  @override
  DataUsageInitialState get initialState => DataUsageInitialState();

  // is called whenever an event related to DataUsage is added
  @override
  Stream<DataUsageState> mapEventToState(DataUsageEvent event) async* {

    // event that first converted into a loading state(which represent as a circularProgressDialog in presentation layer)
    if (event is InitialDataUsageEvent) {
      yield DataUsageLoadingState();
    }

    // event that get DataUsage in domain layer then converted into a state( Success or Failed)
    if (event is RefreshDataUsageEvent || event is InitialDataUsageEvent) {
      final Either<DataUsageFailure, DataUsageModel> value =
          await dataUsageRepository.getDataUsage(DataUsageRequestBody(
              serviceNumber: '09270001926',
              forceRefresh: true,
              primaryResourceType: 'C'));

      yield value.fold(
          (DataUsageFailure failed) => DataUsageFailedState(failed),
          (DataUsageModel successEntity) => DataUsageSuccessState.success(
              mainData: successEntity.promoSubscriptionUsage.mainData[0],));

      if (value.isRight()) {
        await dataUsageRepository.deleteDataUsageLocal();
        await dataUsageRepository
            .insertDataUsageLocal(value.getOrElse(() => null));
      }
    }
  }
}
