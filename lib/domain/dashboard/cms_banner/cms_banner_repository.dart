import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_model.dart';

abstract class CmsBannerRepository {
  // isLocal - true will get local data 1st before remote
  Future<Either<CmsBannerFailure, CmsBannerModel>> getCmsBanner();
  Future insertCmsBannerLocal(CmsBannerModel);
  Future deleteCmsBannerLocal();
}
