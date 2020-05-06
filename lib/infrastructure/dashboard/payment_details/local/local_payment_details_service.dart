import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_model.dart';
import 'package:sembast/sembast.dart';
import '../../../app_database.dart';
import '../../../database_factory.dart'
    if (dart.library.js) 'package:sembast_web/sembast_web.dart';

class LocalPaymentDetailsService {
  static const String PAYMENT_DETAILS = 'paymentDetails';
  final StoreRef<int, Map<String, dynamic>> _paymentDetails =
      intMapStoreFactory.store(PAYMENT_DETAILS);

  Future<Database> get _db async => database();
  Future<Database> database() {
    if (!kIsWeb)
      return AppDatabase.instance.database;
    else
      return databaseFactoryWeb.openDatabase(PAYMENT_DETAILS);
  }

  Future<void> insert(PaymentDetailsModel paymentDetailsModel) async {
    try {
      await _paymentDetails.add(await _db, paymentDetailsModel.toJson());
    } catch (error) {
      print('insert ' + error.toString());
    }
  }

  Future<void> delete() async {
    await _paymentDetails.delete(
      await _db,
    );
  }

  Future<Either<PaymentDetailsFailure, PaymentDetailsModel>>
      getPaymentDetails() async {
    try {
      final Finder finder = Finder(limit: 1);
      final List<RecordSnapshot<int, Map<String, dynamic>>> recordSnapshots =
          await _paymentDetails.find(await _db, finder: finder);
      return right(recordSnapshots
          .map((RecordSnapshot<int, Map<String, dynamic>> snapshot) {
        return PaymentDetailsModel.fromJson(snapshot.value);
      }).first);
    } catch (error) {
      print('getPaymentDetails errorlocal ' + error.toString());
      return left(PaymentDetailsFailure.localError(error.toString()));
    }
  }
}
