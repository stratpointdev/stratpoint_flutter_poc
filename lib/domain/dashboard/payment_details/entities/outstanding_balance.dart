import 'account_balance.dart';
import 'last_payment.dart';

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