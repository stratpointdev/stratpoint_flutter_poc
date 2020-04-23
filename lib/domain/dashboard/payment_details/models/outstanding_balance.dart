import 'package:globe_one_poc_project/domain/dashboard/payment_details/models/account_balance.dart';
import 'package:globe_one_poc_project/domain/dashboard/payment_details/models/last_payment.dart';

class OutstandingBalance {
  AccountBalance accountBalance;
  LastPayment lastPayment;

  OutstandingBalance({this.accountBalance, this.lastPayment});

  factory OutstandingBalance.fromJson(Map<String, dynamic> json) {
    return OutstandingBalance(
      accountBalance: AccountBalance.fromJson(json['accountBalanceDt']),
      lastPayment: LastPayment.fromJson(json['lastPaymentDt']),
    );
  }
}
