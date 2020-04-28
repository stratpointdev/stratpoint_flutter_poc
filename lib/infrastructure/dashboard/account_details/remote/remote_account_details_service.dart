import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_failures.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_model.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/account_details/remote/account_details_sample.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteAccountDetailsService {
  final api = Api();

  Future<Either<AccountDetailsFailures, AccountDetailsModel>>
      getAccountDetails() async {
    bool isSuccess = true;
    await Future.delayed(Duration(seconds: 2));
    if (isSuccess) {
      SharedPreferences myPrefs = await SharedPreferences.getInstance();
      myPrefs.setString('LastAccountDetailsCall', DateTime.now().toString());
      var body = jsonDecode(AccountDetailsSampleResponse.body);
      print(body);
      print(AccountDetailsModel.fromJson(body)
          .detailsByMsisdnResponse
          .detailsByMsisdnResult
          .subscriberHeader
          .nameInfo
          .nameElement3);
      return right(AccountDetailsModel.fromJson(body));
    } else {
      return left(AccountDetailsFailures());
    }

    return right(AccountDetailsModel.fromJson(jsonResponse));
  }
}
