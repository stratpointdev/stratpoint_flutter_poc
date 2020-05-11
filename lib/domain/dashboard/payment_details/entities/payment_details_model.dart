/// This entity contains all of the objects
/// needed for parsing the response of the
/// Payment Details API
class PaymentDetailsModel {
  PaymentDetailsModel(
      this.responseCode, this.outstandingBalanceByMsisdnResponse);

  factory PaymentDetailsModel.fromJson(Map<dynamic, dynamic> json) {
    return PaymentDetailsModel(
      json['responseCode'] as int,
      OutstandingBalanceByMsisdnResponse.fromJson(
        json['outstandingBalanceByMsisdnResponse'] as Map<dynamic, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'outstandingBalanceByMsisdnResponse':
          outstandingBalanceByMsisdnResponse.toJson(),
    };
  }

  int responseCode;
  List<BalanceByMsisdnError> errors;
  OutstandingBalanceByMsisdnResponse outstandingBalanceByMsisdnResponse;
}

class BalanceByMsisdnError {}

class OutstandingBalanceByMsisdnResponse {
  OutstandingBalanceByMsisdnResponse(this.outstandingBalanceByMsisdnResult);
  factory OutstandingBalanceByMsisdnResponse.fromJson(
      Map<dynamic, dynamic> json) {
    return OutstandingBalanceByMsisdnResponse(
      OutstandingBalanceByMsisdnResult.fromJson(
        json['outstandingBalanceByMsisdnResult'] as Map<dynamic, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'outstandingBalanceByMsisdnResult':
          outstandingBalanceByMsisdnResult.toJson(),
    };
  }

  OutstandingBalanceByMsisdnResult outstandingBalanceByMsisdnResult;
}

class OutstandingBalanceByMsisdnResult {
  OutstandingBalanceByMsisdnResult(this.lastPaymentDt, this.overDueDate,
      this.overDueBalance, this.resultNameSpace);

  factory OutstandingBalanceByMsisdnResult.fromJson(
      Map<dynamic, dynamic> json) {
    return OutstandingBalanceByMsisdnResult(
      LastPaymentDt.fromJson(json['lastPaymentDt'] as Map<dynamic, dynamic>),
      json['overDueDate'].toString(),
      json['overDueBalance'].toString(),
      json['resultNameSpace'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'lastPaymentDt': lastPaymentDt.toJson(),
      'overDueDate': overDueDate.toString(),
      'overDueBalance': overDueBalance.toString(),
      'resultNameSpace': resultNameSpace.toString(),
    };
  }

  LastPaymentDt lastPaymentDt;
  String overDueDate;
  String overDueBalance;
  String resultNameSpace;
}

class LastPaymentDt {
  LastPaymentDt({this.amount, this.creditId, this.paymentDate});

  factory LastPaymentDt.fromJson(Map<dynamic, dynamic> json) {
    return LastPaymentDt(
      amount: json['amount'].toString(),
      creditId: json['creditId'] as int,
      paymentDate: json['paymentDate'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'amount': amount,
      'creditId': creditId,
      'paymentDate': paymentDate,
    };
  }

  String amount;
  int creditId;
  String paymentDate;
}
