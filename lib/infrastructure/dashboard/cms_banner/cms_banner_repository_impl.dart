import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/cms_banner_repository.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/common/datetime_converter.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/cms_banner/local/local_cms_banner_service.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/cms_banner/remote/remote_cms_banner_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CmsBannerRepositoryImpl implements CmsBannerRepository {
  CmsBannerRepositoryImpl(
      this.remoteCmsBannerService, this.localCmsBannerService);
  final RemoteCmsBannerService remoteCmsBannerService;
  final LocalCmsBannerService localCmsBannerService;
  @override
  Future<Either<CmsBannerFailure, CmsBannerModel>> getCmsBanner() async {
    final SharedPreferences myPrefs = await SharedPreferences.getInstance();
    final int secs =
        DateTimeConverter.getSecsDiff(myPrefs.getString('LastApiCall'));

    if (secs <= 30) {
      return localCmsBannerService.getCmsBanner();
    } else {
      return remoteCmsBannerService
          .getCmsBanner()
          .then((Either<CmsBannerFailure, CmsBannerModel> value) {
        if (value.isLeft()) {
          return localCmsBannerService.getCmsBanner();
        } else {
          return value;
        }
      });
    }
  }

  @override
   Future<Map<String, String>> getCmsBannerImage(Map<String, String> imagePaths) async  {
    final Map<String, String> paths = <String, String>{};
      imagePaths.forEach((String key, String value) async  {
      final String bannerImage = await remoteCmsBannerService.getCmsBannerImage(value);
      paths.putIfAbsent(key, () => bannerImage);
    });

    return paths;

  }

  @override
  Future<void> deleteCmsBannerLocal() async {
    return localCmsBannerService.delete();
  }

  @override
  Future<void> insertCmsBannerLocal(CmsBannerModel cmsBannerModel) async {
    return localCmsBannerService.insert(cmsBannerModel);
  }

}
