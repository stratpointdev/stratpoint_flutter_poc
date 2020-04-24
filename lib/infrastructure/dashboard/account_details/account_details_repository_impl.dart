import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/account_details_repository.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_failures.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_model.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/account_details/remote/remote_account_details_service.dart';

class AccountDetailsRepositoryImpl implements AccountDetailsRepository {
  final RemoteAccountDetailsService remoteAccountService;

  AccountDetailsRepositoryImpl(this.remoteAccountService);

  @override
  Future<Either<AccountDetailsFailures, AccountDetailsModel>>
      getAccountDetails() async {
    return await remoteAccountService.getAccountDetails();
  }
}
