import 'package:dartz/dartz.dart';

import 'entities/account_details_failures.dart';
import 'entities/account_details_model.dart';
import 'entities/account_details_request_body.dart';

abstract class AccountDetailsRepository {
  Future<Either<AccountDetailsFailures, AccountDetailsModel>> getAccountDetails(
      AccountDetailsRequestBody accountDetailsRequestBody);
  Future<void> insertPaymentDetailsLocal(
      AccountDetailsModel accountDetailsModel);
  Future<void> deletePaymentDetailsLocal();
}
