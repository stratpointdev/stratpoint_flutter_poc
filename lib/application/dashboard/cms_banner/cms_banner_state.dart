import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CmsBannerState extends Equatable {
  const CmsBannerState();

  @override
  List<Object> get props => <Object>[];
}

class CmsBannerInitialState extends CmsBannerState {}

class CmsBannerLoadingState extends CmsBannerState {}

class CmsBannerSuccessState extends CmsBannerState {
  const CmsBannerSuccessState(
      {this.imageList,
      this.imagePaths,
      this.imageLinks,
      this.cmsUsername,
      this.cmsPassword,
      this.cmsBaseUrl});

  final List<Image> imageList;
  final Map<String, String> imagePaths;
  final Map<String, String> imageLinks;
  final String cmsUsername;
  final String cmsPassword;
  final String cmsBaseUrl;

  @override
  List<Object> get props => <Object>[imagePaths, imageLinks];
}

class CmsBannerFailedState extends CmsBannerState {}
