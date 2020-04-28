import 'package:dartz/dartz.dart';

import 'entities/account_details_failures.dart';
import 'entities/account_details_model.dart';

abstract class AccountDetailsRepository {
  // isLocal - true will get local data 1st before remote
  Future<Either<AccountDetailsFailures, AccountDetailsModel>>
      getAccountDetails({bool isLocal});
  Future insertPaymentDetailsLocal(AccountDetailsModel);
  Future deletePaymentDetailsLocal();


}
