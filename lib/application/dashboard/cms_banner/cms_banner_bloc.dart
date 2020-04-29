import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/cms_banner/cms_banner_event.dart';
import 'package:globe_one_poc_project/application/dashboard/cms_banner/cms_banner_state.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/cms_banner_repository.dart';

class CmsBannerBloc extends Bloc<CmsBannerEvent, CmsBannerState> {
  final CmsBannerRepository cmsBannerRepository;

  CmsBannerBloc(this.cmsBannerRepository);

  @override
  CmsBannerState get initialState => CmsBannerInitialState();

  @override
  Stream<CmsBannerState> mapEventToState(CmsBannerEvent event) async* {
    if (event is InitialCmsBannerEvent) {
      yield CmsBannerLoadingState();
      var value = await cmsBannerRepository.getCmsBanner(isLocal: false);

      yield value.fold(
          (failures) => CmsBannerFailedState(),
          (success_entity) => CmsBannerSuccessState(imagePaths: [
                success_entity.imagePath1,
                success_entity.imagePath2,
                success_entity.imagePath3,
                success_entity.imagePath4,
                success_entity.imagePath5,
                success_entity.imagePath6,
                success_entity.imagePath7,
                success_entity.imagePath8,
                success_entity.imagePath9,
                success_entity.imagePath10,
              ], imageLinks: [
                success_entity.link1,
                success_entity.link2,
                success_entity.link3,
                success_entity.link4,
                success_entity.link5,
                success_entity.link6,
                success_entity.link7,
                success_entity.link8,
                success_entity.link9,
                success_entity.link9,
              ]));
    }
  }
}
