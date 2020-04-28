import 'package:globe_one_poc_project/domain/dashboard/common/datetime_converter.dart';

class PaymentDetailsModel {
  int responseCode;
  List<BalanceByMsisdnError> errors;
  OutstandingBalanceByMsisdnResponse outstandingBalanceByMsisdnResponse;
  PaymentDetailsModel(
      this.responseCode, this.outstandingBalanceByMsisdnResponse);

  factory PaymentDetailsModel.fromJson(Map<dynamic, dynamic> json) {
    print('PaymentDetailsModel ' + json.toString());
    return PaymentDetailsModel(
      json["responseCode"],
      OutstandingBalanceByMsisdnResponse.fromJson(
        json["outstandingBalanceByMsisdnResponse"],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'outstandingBalanceByMsisdnResponse':
          outstandingBalanceByMsisdnResponse.toJson(),
    };
  }
}

class BalanceByMsisdnError {}

class OutstandingBalanceByMsisdnResponse {
  OutstandingBalanceByMsisdnResult outstandingBalanceByMsisdnResult;
  OutstandingBalanceByMsisdnResponse(this.outstandingBalanceByMsisdnResult);
  factory OutstandingBalanceByMsisdnResponse.fromJson(
      Map<dynamic, dynamic> json) {
    return OutstandingBalanceByMsisdnResponse(
      OutstandingBalanceByMsisdnResult.fromJson(
        json["outstandingBalanceByMsisdnResult"],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'outstandingBalanceByMsisdnResult':
          outstandingBalanceByMsisdnResult.toJson(),
    };
  }
}

class OutstandingBalanceByMsisdnResult {
  LastPaymentDt lastPaymentDt;
  String overDueDate;
  String overDueBalance;
  String resultNameSpace;

  OutstandingBalanceByMsisdnResult(this.lastPaymentDt, this.overDueDate,
      this.overDueBalance, this.resultNameSpace);

  factory OutstandingBalanceByMsisdnResult.fromJson(
      Map<dynamic, dynamic> json) {
    return OutstandingBalanceByMsisdnResult(
      LastPaymentDt.fromJson(json['lastPaymentDt']),
      DateTimeConverter.convertToDate(json['overDueDate'].toString()),
      json['overDueBalance'].toString(),
      json['resultNameSpace'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lastPaymentDt': lastPaymentDt.toJson(),
      'overDueDate': overDueDate.toString(),
      'overDueBalance': overDueBalance.toString(),
      'resultNameSpace': resultNameSpace.toString(),
    };
  }
}

class LastPaymentDt {
  double amount;
  int creditId;
  String paymentDate;
  LastPaymentDt({this.amount, this.creditId, this.paymentDate});

  factory LastPaymentDt.fromJson(Map<dynamic, dynamic> json) {
    return LastPaymentDt(
      amount: json['amount'],
      creditId: json['creditId'],
      paymentDate: json['paymentDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'creditId': creditId,
      'paymentDate': paymentDate,
    };
  }
}
