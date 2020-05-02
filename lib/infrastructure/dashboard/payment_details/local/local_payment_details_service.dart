import 'package:dartz/dartz.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_failure.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/entities/payment_details_model.dart';
import 'package:sembast/sembast.dart';
import '../../../database_factory.dart'
    if (dart.library.js) 'package:sembast_web/sembast_web.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../../app_database.dart';

class LocalPaymentDetailsService {
  static const String PAYMENT_DETAILS = 'paymentDetails';
  final _paymentDetails = intMapStoreFactory.store(PAYMENT_DETAILS);

  Future<Database> get _db async => database();
  Future<Database> database() {
    if (!kIsWeb)
      return AppDatabase.instance.database;
    else
      return databaseFactoryWeb.openDatabase(PAYMENT_DETAILS);
  }

  Future insert(PaymentDetailsModel paymentDetailsModel) async {
    try {
      await _paymentDetails.add(await _db, paymentDetailsModel.toJson());
    } catch (error) {
      print('insert ' + error.toString());
    }
  }

  Future delete() async {
    await _paymentDetails.delete(
      await _db,
    );
  }

  Future<Either<PaymentDetailsFailure, PaymentDetailsModel>>
      getPaymentDetails() async {
    try {
      final finder = Finder(limit: 1);
      final recordSnapshots =
          await _paymentDetails.find(await _db, finder: finder);
      return right(recordSnapshots.map((snapshot) {
        return PaymentDetailsModel.fromJson(snapshot.value);
      }).first);
    } catch (error) {
      print('getPaymentDetails errorlocal ' + error.toString());
      return left(PaymentDetailsFailure.localError(error.toString()));
    }
  }
}
