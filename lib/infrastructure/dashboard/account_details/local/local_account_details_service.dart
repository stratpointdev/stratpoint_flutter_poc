import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_failures.dart';
import 'package:globe_one_poc_project/domain/dashboard/account_details/entities/account_details_model.dart';
import 'package:sembast/sembast.dart';
import '../../../app_database.dart';
import '../../../database_factory.dart'
    if (dart.library.js) 'package:sembast_web/sembast_web.dart';

class LocalAccountDetailsService {
  static const String ACCOUNT_DETAILS = 'accountDetails';
  final StoreRef<int, Map<String, dynamic>> _accountDetails =
      intMapStoreFactory.store(ACCOUNT_DETAILS);

  Future<Database> get _db async => database();

  //Openning our local database
  Future<Database> database() {
    if (!kIsWeb)
      return AppDatabase.instance.database;
    else
      return databaseFactoryWeb.openDatabase(ACCOUNT_DETAILS);
  }

  //This method will save the AccountDetails object into our local database.
  Future<void> insert(AccountDetailsModel accountDetailsModel) async {
    print('insert ');
    try {
      await _accountDetails.add(await _db, accountDetailsModel.toJson());
    } catch (error) {
      print('insert ' + error.toString());
    }
  }

  //Method to delete AccountDetails object from local database.
  Future<void> delete() async {
    print('delete');
    await _accountDetails.delete(
      await _db,
    );
  }

  //This method will fetch the AccountDetails object from our database.
  Future<Either<AccountDetailsFailures, AccountDetailsModel>>
      getAccountDetails() async {
    try {
      final Finder finder = Finder(limit: 1);
      final List<RecordSnapshot<int, Map<String, dynamic>>> recordSnapshots =
          await _accountDetails.find(await _db, finder: finder);
      return right(recordSnapshots
          .map((RecordSnapshot<int, Map<String, dynamic>> snapshot) {
        return AccountDetailsModel.fromJson(snapshot.value);
      }).first);
    } catch (error) {
      print('getAccountDetails errorlocal ' + error.toString());
      return left(AccountDetailsFailures.localError(error.toString()));
    }
  }
}
