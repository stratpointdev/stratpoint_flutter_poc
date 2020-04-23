import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_failures.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_model.dart';

class RemoteAccountDetailsService {
  String baseUrl =
      'https://virtserver.swaggerhub.com/S1723/G1ES-OCSP-API-ALL/1.0.0"';

  Future<Either<AccountDetailsFailures, AccountDetailsModel>>
      getAccountDetails() async {
    bool isSuccess = true;
    await Future.delayed(Duration(seconds: 2));
    if (isSuccess) {
      return right(AccountDetailsModel());
    } else {
      return left(AccountDetailsFailures());
    }
  }
}

class AccountDetailsFailurAes {}
