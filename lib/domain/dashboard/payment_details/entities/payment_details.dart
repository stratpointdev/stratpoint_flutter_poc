

class AccountBalance{

final double arBalance;
AccountBalance({
  this.arBalance
});

factory AccountBalance.fromJson(Map<String, dynamic> json) {

  print("json : "+json['arBalance'].toString());
  return AccountBalance(
    arBalance: json['arBalance'],
  );
}

}

class LastPayment{
  final int amount;
  final int creditId;
  final int paymentDate;

  LastPayment({this.amount, this.creditId, this.paymentDate});

  factory LastPayment.fromJson(Map<String, dynamic> json) {

    print("json : "+json['amount'].toString());
    return LastPayment(
      amount: json['amount'],
      creditId: json['creditId'],
      paymentDate: json['paymentDate'],
    );
  }

}

class OutstandingBalance {
  final AccountBalance accountBalance;
  final LastPayment lastPayment;

  OutstandingBalance({this.accountBalance, this.lastPayment});

  factory OutstandingBalance.fromJson(Map<String, dynamic> json) {
    return OutstandingBalance(
      accountBalance: AccountBalance.fromJson(json['accountBalanceDt']),
      lastPayment: LastPayment.fromJson(json['lastPaymentDt']),
    );
  }

}

