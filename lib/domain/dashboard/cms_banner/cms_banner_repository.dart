import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_model.dart';

abstract class CmsBannerRepository {
  Future<Either<CmsBannerFailure, CmsBannerModel>> getCmsBanner();
  Future<List<Image>> getCmsBannerImage(final Map<String, String> imagePaths);
  Future<void> insertCmsBannerLocal(CmsBannerModel cmsBannerModel);
  Future<void> deleteCmsBannerLocal();

}
