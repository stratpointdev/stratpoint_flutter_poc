import 'package:dartz/dartz.dart';

import 'entities/account_details_failures.dart';
import 'entities/account_details_model.dart';

abstract class AccountDetailsRepository {
  Future<Either<AccountDetailsFailures, AccountDetailsModel>>
      getAccountDetails();
  Future<void> insertPaymentDetailsLocal(
      AccountDetailsModel accountDetailsModel);
  Future<void> deletePaymentDetailsLocal();
}
