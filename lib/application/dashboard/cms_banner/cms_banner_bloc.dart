import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globe_one_poc_project/application/dashboard/cms_banner/cms_banner_event.dart';
import 'package:globe_one_poc_project/application/dashboard/cms_banner/cms_banner_state.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/cms_banner_repository.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_model.dart';

class CmsBannerBloc extends Bloc<CmsBannerEvent, CmsBannerState> {
  CmsBannerBloc(this.cmsBannerRepository);

  @override
  CmsBannerState get initialState => CmsBannerInitialState();

  final CmsBannerRepository cmsBannerRepository;

  @override
  Stream<CmsBannerState> mapEventToState(CmsBannerEvent event) async* {
    if (event is InitialCmsBannerEvent) {
      yield CmsBannerLoadingState();
    }
    if (event is RefreshCmsBannerEvent || event is InitialCmsBannerEvent) {
      final Either<CmsBannerFailure, CmsBannerModel> value =
          await cmsBannerRepository.getCmsBanner();

      if (kIsWeb) {
        if (value.isRight()) {
          final List<Image> imageList =
              await cmsBannerRepository.getCmsBannerImage(
                  value.getOrElse(() => null).getImagePathsForWeb());
          yield CmsBannerSuccessState(
              imageList: imageList,
              imageLinks: value.getOrElse(() => null).getImageLinks());
        } else {
          yield CmsBannerFailedState();
        }
      } else {
        yield value.fold(
            (CmsBannerFailure failures) => CmsBannerFailedState(),
            (CmsBannerModel successEntity) => CmsBannerSuccessState(
                imagePaths: successEntity.getImagePaths(),
                imageLinks: successEntity.getImageLinks(),
                cmsUsername: successEntity.getCmsUsername(),
                cmsPassword: successEntity.getCmsPassword(),
                cmsBaseUrl: successEntity.getCmsBaseUrl()));
      }

      if (value.isRight()) {
        await cmsBannerRepository.deleteCmsBannerLocal();
        await cmsBannerRepository
            .insertCmsBannerLocal(value.getOrElse(() => null));
      }
    }
  }
}
