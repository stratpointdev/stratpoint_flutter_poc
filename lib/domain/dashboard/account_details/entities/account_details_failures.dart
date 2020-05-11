/// This entity represents the failure response
/// from the Account Details API.
class AccountDetailsFailures {
  AccountDetailsFailures({this.code, this.message, this.parameter});

  factory AccountDetailsFailures.fromJson(Map<String, dynamic> json) {
    return AccountDetailsFailures(
        code: json['code'] as int,
        message: json['message'] as String,
        parameter: json['parameter'] as String);
  }

  factory AccountDetailsFailures.localError(String error) {
    return AccountDetailsFailures(
      message: error,
    );
  }
  int code;
  String message;
  String parameter;
}
