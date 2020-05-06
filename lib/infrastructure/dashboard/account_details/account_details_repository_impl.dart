import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/account_details_repository.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_failures.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_model.dart';
import 'package:globe_one_poc_project/domain/dashboard/common/datetime_converter.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/account_details/local/local_account_details_service.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/account_details/remote/remote_account_details_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountDetailsRepositoryImpl implements AccountDetailsRepository {
  AccountDetailsRepositoryImpl(
      this.remoteAccountDetailsService, this.localAccountDetailsService);
  final RemoteAccountDetailsService remoteAccountDetailsService;
  final LocalAccountDetailsService localAccountDetailsService;

  @override
  Future<Either<AccountDetailsFailures, AccountDetailsModel>>
      getAccountDetails() async {
    final SharedPreferences myPrefs = await SharedPreferences.getInstance();
    final int secs = DateTimeConverter.getSecsDiff(myPrefs.getString('LastApiCall'));

    if (secs <= 5) {
      return localAccountDetailsService.getAccountDetails();
    } else {
      return remoteAccountDetailsService.getAccountDetails().then((value) {
        if (value.isLeft()) {
          return localAccountDetailsService.getAccountDetails();
        } else {
          return value;
        }
      });
    }
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
