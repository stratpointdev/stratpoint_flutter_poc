import 'package:globe_one_poc_project/infrastructure/dashboard/payment_details/local/local_payment_details_service.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/payment_details_repository.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/payment_details/remote/models/outstanding_balance.dart';
import 'package:globe_one_poc_project/infrastructure/dashboard/payment_details/remote/remote_payment_details_service.dart';

class PaymentDetailsRepositoryImpl implements PaymentDetailsRepository {
  final RemotePaymentDetailsService remotePaymentDetailsService;
  final LocalPaymentDetailsService localPaymentDetailsService;

  PaymentDetailsRepositoryImpl(
      this.remotePaymentDetailsService, this.localPaymentDetailsService);

  @override
  Future<OutstandingBalance> getOutstandingBalance() {
    return remotePaymentDetailsService.getOutstandingBalance();
  }
}
