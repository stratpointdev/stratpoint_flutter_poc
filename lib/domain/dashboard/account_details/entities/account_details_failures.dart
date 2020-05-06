class AccountDetailsFailures {
  AccountDetailsFailures({this.code, this.message, this.parameter});

  factory AccountDetailsFailures.fromJson(Map<String, dynamic> json) {
    return AccountDetailsFailures(
        code: json['code'],
        message: json['message'],
        parameter: json['parameter']);
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
