import 'package:equatable/equatable.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_model.dart';

abstract class AccountDetailsState extends Equatable {
  const AccountDetailsState();

  @override
  List<Object> get props => <Object>[];
}

class AccountDetailsInitialState extends AccountDetailsState {}

class AccountDetailsLoadingState extends AccountDetailsState {}

class AccountDetailsSuccessState extends AccountDetailsState {
  const AccountDetailsSuccessState({this.nameInfo, this.subscriberGeneralInfo});
  final NameInfo nameInfo;
  final SubscriberGeneralInfo subscriberGeneralInfo;

  @override
  List<Object> get props => <Object>[nameInfo, subscriberGeneralInfo];
}

class AccountDetailsFailedState extends AccountDetailsState {}
