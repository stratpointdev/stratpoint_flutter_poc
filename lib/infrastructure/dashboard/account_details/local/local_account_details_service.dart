import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_failures.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_model.dart';
import 'package:sembast/sembast.dart';

import '../../../app_database.dart';

class LocalAccountDetailsService {

  static const String ACCOUNT_DETAILS = 'accountDetails';
  final _accountDetails = intMapStoreFactory.store(ACCOUNT_DETAILS);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(AccountDetailsModel accountDetailsModel) async {
    print('insert ');
    try {
      await _accountDetails.add(await _db, accountDetailsModel.toJson());
    }catch(error){
      print('insert '+error.toString());
    }
  }

  Future delete() async {
    print('delete');
    await _accountDetails.delete(
      await _db,
    );
  }

  Future<Either<AccountDetailsFailures, AccountDetailsModel>> getAccountDetails() async {

    try {
      final finder = Finder( limit: 1 );
      final recordSnapshots = await _accountDetails.find(
          await _db,finder: finder
      );
      return right(recordSnapshots.map((snapshot) {
        return AccountDetailsModel.fromJson(snapshot.value);
      }).first);
    }catch(error){
      print('errorlocal '+error.toString());
      return left(AccountDetailsFailures.localError(error));
    }
  }


}
