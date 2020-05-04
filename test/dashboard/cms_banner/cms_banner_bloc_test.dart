import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/application/dashboard/cms_banner/cms_banner_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/cms_banner/cms_banner_event.dart';
import 'package:globe_one_poc_project/application/dashboard/cms_banner/cms_banner_state.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/cms_banner_repository.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_model.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCmsBannerRepository extends Mock implements CmsBannerRepository {}

void main() {
  CmsBannerBloc bloc;
  CmsBannerRepository mockRepository;

  setUp(() {
    mockRepository = MockCmsBannerRepository();
    bloc = CmsBannerBloc(mockRepository);
  });

  test('Successful RefreshCmsBannerEvent should display CmsBannerSuccessState',
      () {
    Map<String, dynamic> mockCmsResponse = {};

    CmsBannerModel cmsBannerModel = CmsBannerModel(cms: mockCmsResponse);

    when(mockRepository.getCmsBanner())
        .thenAnswer((_) async => right(cmsBannerModel));

    bloc.add(RefreshCmsBannerEvent());

    expectLater(
        bloc,
        emitsInOrder([
          CmsBannerInitialState(),
          CmsBannerSuccessState(
              imagePaths: cmsBannerModel.getImagePaths(),
              imageLinks: cmsBannerModel.getImageLinks())
        ]));
  });
}
