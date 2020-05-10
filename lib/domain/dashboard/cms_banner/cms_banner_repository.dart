import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_model.dart';

abstract class CmsBannerRepository {
  Future<Either<CmsBannerFailure, CmsBannerModel>> getCmsBanner();
  Future<Map<String, String>> getCmsBannerImage(final Map<String, String> imagePaths);
  Future<void> insertCmsBannerLocal(CmsBannerModel cmsBannerModel);
  Future<void> deleteCmsBannerLocal();

}
