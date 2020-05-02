import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/account_details_repository.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_failures.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_model.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/account_details/local/local_account_details_service.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/account_details/remote/remote_account_details_service.dart';

class AccountDetailsRepositoryImpl implements AccountDetailsRepository {
  final RemoteAccountDetailsService remoteAccountDetailsService;
  final LocalAccountDetailsService localAccountDetailsService;
  AccountDetailsRepositoryImpl(
      this.remoteAccountDetailsService, this.localAccountDetailsService);

  @override
  Future<Either<AccountDetailsFailures, AccountDetailsModel>> getAccountDetails() async {
    return remoteAccountDetailsService.getAccountDetails().then((value) {
      if (value.isLeft()) {
        return localAccountDetailsService.getAccountDetails();
      } else {
        return value;
      }
    });
  }

  @override
  Future deletePaymentDetailsLocal() {
    return localAccountDetailsService.delete();
  }

  @override
  Future insertPaymentDetailsLocal(accountDetailsModel) {
    return localAccountDetailsService.insert(accountDetailsModel);
  }
}
