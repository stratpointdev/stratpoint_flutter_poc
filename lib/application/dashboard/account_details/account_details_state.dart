import 'package:equatable/equatable.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_model.dart';

abstract class AccountDetailsState extends Equatable {
  const AccountDetailsState();

  @override
  List<Object> get props => [];
}

class AccountDetailsInitialState extends AccountDetailsState {}

class AccountDetailsLoadingState extends AccountDetailsState {}

class AccountDetailsSuccessState extends AccountDetailsState {
  const AccountDetailsSuccessState({this.nameInfo});
  final NameInfo nameInfo;

  @override
  List<Object> get props => <Object>[nameInfo];
}

class AccountDetailsFailedState extends AccountDetailsState {}
