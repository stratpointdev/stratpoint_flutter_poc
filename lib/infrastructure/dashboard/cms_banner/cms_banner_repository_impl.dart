import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/cms_banner_repository.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/common/datetime_converter.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/cms_banner/local/local_cms_banner_service.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/cms_banner/remote/remote_cms_banner_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CmsBannerRepositoryImpl implements CmsBannerRepository {
  final RemoteCmsBannerService remoteCmsBannerService;
  final LocalCmsBannerService localCmsBannerService;
  CmsBannerRepositoryImpl(
      this.remoteCmsBannerService, this.localCmsBannerService);

  @override
  Future<Either<CmsBannerFailure, CmsBannerModel>> getCmsBanner() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    int secs = DateTimeConverter.getSecsDiff(myPrefs.getString('LastApiCall'));

    if (secs <= 5) {
      return localCmsBannerService.getCmsBanner();
    } else {
      return remoteCmsBannerService.getCmsBanner().then((value) {
        if (value.isLeft()) {
          return localCmsBannerService.getCmsBanner();
        } else {
          return value;
        }
      });
    }
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
