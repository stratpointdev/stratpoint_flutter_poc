import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/account/models/account_failures.dart';

import 'models/account_model.dart';

abstract class AccountRepository {
  Future<Either<AccountFailures, AccountModel>> getAccountDetails();
}
