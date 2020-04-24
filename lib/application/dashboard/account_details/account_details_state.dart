import 'package:equatable/equatable.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_model.dart';

abstract class AccountDetailsState extends Equatable {
  const AccountDetailsState();

  @override
  List<Object> get props => [];
}

class AccountDetailsInitial extends AccountDetailsState {}

class AccountDetailsLoading extends AccountDetailsState {}

class AccountDetailsSuccess extends AccountDetailsState {
  final NameInfo nameInfo;

  const AccountDetailsSuccess({this.nameInfo});

  @override
  List<Object> get props => [nameInfo];
}

class AccountDetailsFailed extends AccountDetailsState {}
