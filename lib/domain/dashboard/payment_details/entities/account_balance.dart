class AccountBalance  {

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