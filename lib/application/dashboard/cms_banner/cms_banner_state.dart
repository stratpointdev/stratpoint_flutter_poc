import 'package:equatable/equatable.dart';

abstract class CmsBannerState extends Equatable {
  const CmsBannerState();

  @override
  List<Object> get props => [];
}

class CmsBannerInitialState extends CmsBannerState {}

class CmsBannerLoadingState extends CmsBannerState {}

class CmsBannerSuccessState extends CmsBannerState {
  final List<String> imagePaths;
  final List<String> imageLinks;

  const CmsBannerSuccessState({this.imagePaths, this.imageLinks});

  @override
  List<Object> get props => [imagePaths, imageLinks];
}

class CmsBannerFailedState extends CmsBannerState {}
