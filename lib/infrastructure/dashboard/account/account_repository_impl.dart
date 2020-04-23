import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/domain/dashboard/account/account_repository.dart';
import 'package:globe_one_poc_project/domain/dashboard/account/models/account_failures.dart';
import 'package:globe_one_poc_project/domain/dashboard/account/models/account_model.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/account/remote/remote_account_service.dart';

class AccountRepositoryImpl implements AccountRepository {
  final RemoteAccountService remoteAccountService;

  AccountRepositoryImpl({@required this.remoteAccountService})
      : assert(remoteAccountService != null);

  @override
  Future<Either<AccountFailures, AccountModel>> getAccountDetails() async {
    return await remoteAccountService.getAccountDetails();
  }
}
