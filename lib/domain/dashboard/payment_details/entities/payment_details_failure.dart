class PaymentDetailsFailure {
  PaymentDetailsFailure({this.code, this.message, this.parameter});

  factory PaymentDetailsFailure.fromJson(Map<String, dynamic> json) {
    return PaymentDetailsFailure(
      code: json['code'],
      message: json['message'],
      parameter: json['parameter'],
    );
  }

  factory PaymentDetailsFailure.localError(String error){
    return PaymentDetailsFailure(
      message: error,
    );
  }
  String code;
  String message;
  String parameter;
}
