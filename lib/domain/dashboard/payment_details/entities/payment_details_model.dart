
class PaymentDetailsModel {
  int responseCode;
  List<BalanceByMsisdnError> errors;
  OutstandingBalanceByMsisdnResponse outstandingBalanceByMsisdnResponse;
  PaymentDetailsModel(
      this.responseCode, this.outstandingBalanceByMsisdnResponse);

  factory PaymentDetailsModel.fromJson(Map<dynamic, dynamic> json) {
  print('PaymentDetailsModel '+json.toString());
    return PaymentDetailsModel(
      json["responseCode"],
      OutstandingBalanceByMsisdnResponse.fromJson(
        json["outstandingBalanceByMsisdnResponse"],
      ),
    );
  }

  Map<String, dynamic> toJson() {

    return {
      'outstandingBalanceByMsisdnResponse': outstandingBalanceByMsisdnResponse.toJson(),
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
      'outstandingBalanceByMsisdnResult': outstandingBalanceByMsisdnResult.toJson(),
    };
  }


}

class OutstandingBalanceByMsisdnResult {
  String overDueDate;
  String overDueBalance;
  String resultNameSpace;

  OutstandingBalanceByMsisdnResult(
      this.overDueDate, this.overDueBalance, this.resultNameSpace);

  factory OutstandingBalanceByMsisdnResult.fromJson(
      Map<dynamic, dynamic> json) {

    return OutstandingBalanceByMsisdnResult(
      json['overDueDate'].toString(),
      json['overDueBalance'].toString(),
      json['resultNameSpace'],
    );
  }



  Map<String, dynamic> toJson() {
    return {
      'overDueDate': overDueDate.toString(),
      'overDueBalance': overDueBalance.toString(),
      'resultNameSpace': resultNameSpace.toString(),
    };
  }
}
