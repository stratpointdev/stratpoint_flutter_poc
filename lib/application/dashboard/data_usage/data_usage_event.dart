import 'package:equatable/equatable.dart';

abstract class DataUsageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RefreshDataUsageEvent extends DataUsageEvent {}

class InitialDataUsageEvent extends DataUsageEvent {}
