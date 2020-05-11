/// This entity represents the Failure response
/// from the Payment Details API.
class PaymentDetailsFailure {
  PaymentDetailsFailure({this.code, this.message, this.parameter});

  factory PaymentDetailsFailure.fromJson(Map<String, dynamic> json) {
    return PaymentDetailsFailure(
      code: json['code'] as String,
      message: json['message'] as String,
      parameter: json['parameter'] as String,
    );
  }

  factory PaymentDetailsFailure.localError(String error) {
    return PaymentDetailsFailure(
      message: error,
    );
  }
  String code;
  String message;
  String parameter;
}
