import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_event.dart';
import 'package:globe_one_poc_project/application/dashboard/data_usage/data_usage_state.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/data_usage_repository.dart';
import 'package:globe_one_poc_project/domain/dashboard/data_usage/entities/data_usage_model.dart';
import 'package:mockito/mockito.dart';

class MockDataUsageRepository extends Mock implements DataUsageRepository {}

void main() {
  DataUsageBloc bloc;
  DataUsageRepository mockRepository;

  setUp(() {
    mockRepository = MockDataUsageRepository();
    bloc = DataUsageBloc(mockRepository);
  });

  test('Successful RefreshDataUsageEvent should display DataUsageSuccessState',
      () {
    final DataUsage dataUsage = DataUsage(
        bucketId: 'GS_17194649',
        startDate: '2020-01-11T02:23:34',
        endDate: '2020-05-10T23:59:59',
        state: 'Active',
        volumeRemaining: '10485760',
        totalAllocated: '10485760',
        volumeUsed: '0',
        unit: 'KB');
    final List<DataUsage> dataUsages = <DataUsage>[dataUsage];
    final Buckets buckets = Buckets(dataUsageList: dataUsages);
    final RetrieveSubscriberUsageResult result =
        RetrieveSubscriberUsageResult(buckets: buckets);
    final DataUsageModel dataUsageModel =
        DataUsageModel(retrieveSubscriberUsageResult: result);

    when(mockRepository.getDataUsage())
        .thenAnswer((_) async => right(dataUsageModel));

    bloc.add(RefreshDataUsageEvent());

    expectLater(
        bloc,
        emitsInOrder(<DataUsageState>[
          DataUsageInitialState(),
          DataUsageSuccessState.dataUsageSuccesState(dataUsageModel
              .retrieveSubscriberUsageResult.buckets.dataUsageList)
        ]));
  });
}
