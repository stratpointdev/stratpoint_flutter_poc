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
      var value = await cmsBannerRepository.getCmsBanner(isLocal: true);

      yield value.fold(
          (failures) => CmsBannerFailedState(),
          (success_entity) => CmsBannerSuccessState(
              imagePaths: success_entity.getImagePaths(),
              imageLinks: success_entity.getImageLinks()));

      if (value.isRight()) {
        await cmsBannerRepository.deleteCmsBannerLocal();
        await cmsBannerRepository
            .insertCmsBannerLocal(value.getOrElse(() => null));
      }
    }
    if (event is RefreshCmsBannerEvent) {
      yield CmsBannerLoadingState();
      var value = await cmsBannerRepository.getCmsBanner(isLocal: true);

      yield value.fold(
          (failures) => CmsBannerFailedState(),
          (success_entity) => CmsBannerSuccessState(
              imagePaths: success_entity.getImagePaths(),
              imageLinks: success_entity.getImageLinks()));

      if (value.isRight()) {
        await cmsBannerRepository.deleteCmsBannerLocal();
        await cmsBannerRepository
            .insertCmsBannerLocal(value.getOrElse(() => null));
      }
    }
  }
}
