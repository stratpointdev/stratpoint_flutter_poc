class LastPayment {


int amount;
int creditId;
int paymentDate;

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
