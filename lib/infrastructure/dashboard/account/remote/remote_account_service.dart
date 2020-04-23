import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/account/models/account_failures.dart';
import 'package:globe_one_poc_project/domain/dashboard/account/models/account_model.dart';

class RemoteAccountService {
  String baseUrl =
      'https://virtserver.swaggerhub.com/S1723/G1ES-OCSP-API-ALL/1.0.0"';

  Future<Either<AccountFailures, AccountModel>> getAccountDetails() async {
    bool isSuccess = true;
    await Future.delayed(Duration(seconds: 2));
    if (isSuccess) {
      return right(AccountModel());
    } else {
      return left(AccountFailures());
    }
  }
}
