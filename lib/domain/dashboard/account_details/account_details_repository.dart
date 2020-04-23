import 'package:dartz/dartz.dart';

import 'models/account_details_failures.dart';
import 'models/account_details_model.dart';

abstract class AccountDetailsRepository {
  Future<Either<AccountDetailsFailures, AccountDetailsModel>>
      getAccountDetails();
}
