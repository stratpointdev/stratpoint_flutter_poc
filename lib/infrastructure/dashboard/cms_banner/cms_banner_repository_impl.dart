import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:globe_one_poc_project/domain/cache_configuration/cache_configuration_repository.dart';
import 'package:globe_one_poc_project/domain/cache_configuration/entities/cache_configuration_details_model.dart';

import 'package:globe_one_poc_project/domain/dashboard/cms_banner/cms_banner_repository.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/cms_banner/entities/cms_banner_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/common/datetime_converter.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/cms_banner/local/local_cms_banner_service.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/cms_banner/remote/remote_cms_banner_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CmsBannerRepositoryImpl implements CmsBannerRepository {
  CmsBannerRepositoryImpl(this.remoteCmsBannerService,
      this.localCmsBannerService, this.cacheConfigurationRepository);
  final RemoteCmsBannerService remoteCmsBannerService;
  final LocalCmsBannerService localCmsBannerService;
  final CacheConfigurationRepository cacheConfigurationRepository;

  //This method will check the cache interval config then get the CmsBanner object from our data sources.
  @override
  Future<Either<CmsBannerFailure, CmsBannerModel>> getCmsBanner() async {
    final SharedPreferences myPrefs = await SharedPreferences.getInstance();
    final int secs =
        DateTimeConverter.getSecsDiff(myPrefs.getString('LastApiCall'));

    final CacheConfigurationDetailsModel cacheConfiguration =
        await cacheConfigurationRepository.getCacheInterval();

    if (secs <= cacheConfiguration.interval) {
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

  //Method to get the list of cms banner for flutter web
  @override
  Future<List<Image>> getCmsBannerImage(Map<String, String> imagePaths) async {
    final List<Image> imageList = <Image>[];
    for (final MapEntry<String, String> entry in imagePaths.entries) {
      final String bannerImage =
          await remoteCmsBannerService.getCmsBannerImage(entry.value);
      imageList.add(imageFromBase64String(bannerImage));
    }
    return imageList;
  }

  //Method to call localCmsBannerService.delete() from local data service
  @override
  Future<void> deleteCmsBannerLocal() async {
    return localCmsBannerService.delete();
  }

  //Method to call localCmsBannerService.insert() from local data service
  @override
  Future<void> insertCmsBannerLocal(CmsBannerModel cmsBannerModel) async {
    return localCmsBannerService.insert(cmsBannerModel);
  }

  //Method to decode base64
  Image imageFromBase64String(String base64String) {
    Image image;

    try {
      image = Image.memory(base64Decode(base64String.substring(22)));
    } catch (error) {
      print('imageFromBase64String ' + error.toString());
    }
    return image;
  }
}
