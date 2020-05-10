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
    final MainData mainData = MainData(
        skelligWallet: '1230',
        skelligCategory: '1230',
        dataRemaining: 10000000,
        dataTotal: 10000000,
        dataUsed: '0',
        endDate: '2020-05-12T23:59:59',
        type: 'BULK');

    final List<MainData> dataUsages = <MainData>[];
    dataUsages.add(mainData);
    final PromoSubscriptionUsage promoSubscriptionUsage =
        PromoSubscriptionUsage(mainData: dataUsages);
    final DataUsageModel dataUsageModel =
        DataUsageModel(promoSubscriptionUsage: promoSubscriptionUsage);

    when(mockRepository.getDataUsage(any))
        .thenAnswer((_) async => right(dataUsageModel));

    bloc.add(RefreshDataUsageEvent());

    expectLater(
        bloc,
        emitsInOrder(<DataUsageState>[
          DataUsageInitialState(),
          const DataUsageSuccessState()
        ]));
  });
}
