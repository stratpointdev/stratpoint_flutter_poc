class DataUsageFailure {
  DataUsageFailure({this.code, this.message, this.parameter});

  factory DataUsageFailure.fromJson(Map<String, dynamic> json) {
    return DataUsageFailure(
        code: json['code'] as int,
        message: json['message'] as String,
        parameter: json['parameter'] as String);
  }

  factory DataUsageFailure.localError(String error) {
    return DataUsageFailure(
      message: error,
    );
  }
  int code;
  String message;
  String parameter;
}
