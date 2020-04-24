class DataUsageFailure {
  String code;
  String message;
  String parameter;
  DataUsageFailure({this.code, this.message, this.parameter});

  factory DataUsageFailure.fromJson(Map<String, dynamic> json) {
    return DataUsageFailure(
        code: json['code'],
        message: json['message'],
        parameter: json['parameter']);
  }
}