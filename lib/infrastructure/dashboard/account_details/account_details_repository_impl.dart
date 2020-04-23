import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/account_details_repository.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/models/account_details_failures.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/models/account_details_model.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/account_details/remote/remote_account_details_service.dart';

class AccountDetailsRepositoryImpl implements AccountDetailsRepository {
  final RemoteAccountDetailsService remoteAccountService;

  AccountDetailsRepositoryImpl({@required this.remoteAccountService})
      : assert(remoteAccountService != null);

  @override
  Future<Either<AccountDetailsFailures, AccountDetailsModel>>
      getAccountDetails() async {
    return await remoteAccountService.getAccountDetails();
  }
}
