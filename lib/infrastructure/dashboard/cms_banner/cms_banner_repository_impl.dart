import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/cms_banner_repository.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_failure.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/cms_banner/local/local_cms_banner_service.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/cms_banner/remote/remote_cms_banner_service.dart';

class CmsBannerRepositoryImpl implements CmsBannerRepository {
  final RemoteCmsBannerService remoteCmsBannerService;
  final LocalCmsBannerService localCmsBannerService;
  CmsBannerRepositoryImpl(
      this.remoteCmsBannerService, this.localCmsBannerService);

  @override
  Future<Either<CmsBannerFailures, CmsBannerModel>> getCmsBanner(
      {bool isLocal}) {

/*    if (isLocal) {
      return localCmsBannerService.getCmsBanner().then((value) {
        if (value.isLeft()) {
          return remoteCmsBannerService.getCmsBanner();
        } else {
          return value;
        }
      });
    } else {
      return remoteCmsBannerService.getCmsBanner();
    }*/
    return  localCmsBannerService.getCmsBanner();
  }

  @override
  Future deleteCmsBannerLocal() {
    return localCmsBannerService.delete();
  }

  @override
  Future insertCmsBannerLocal(cmsBannerModel) {
    return localCmsBannerService.insert(cmsBannerModel);
  }
}
