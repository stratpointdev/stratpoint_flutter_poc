import 'package:globe_one_poc_project/infrastructure/dashboard/payment_details/remote/models/outstanding_balance.dart';

abstract class PaymentDetailsRepository {
  Future<OutstandingBalance> getOutstandingBalance();
}
