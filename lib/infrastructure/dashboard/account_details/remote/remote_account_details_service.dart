import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_failures.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_model.dart';
import 'package:globe_one_poc_project/infrastructure/api.dart';

class RemoteAccountDetailsService {
  final api = Api();

  Future<Either<AccountDetailsFailures, AccountDetailsModel>>
      getAccountDetails() async {
    final jsonResponse = await api.getJsonResponse(api.getSubscriberDetails());

    if (jsonResponse == null) {
      return left(AccountDetailsFailures());
    }

    return right(AccountDetailsModel.fromJson(jsonResponse));
  }
}
