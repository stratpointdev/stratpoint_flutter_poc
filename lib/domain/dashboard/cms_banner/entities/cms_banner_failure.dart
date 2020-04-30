class CmsBannerFailures {
  int code;
  String message;
  CmsBannerFailures({this.code, this.message});

  factory CmsBannerFailures.fromJson(Map<String, dynamic> json) {
    return CmsBannerFailures(code: json['code'], message: json['message']);
  }

  factory CmsBannerFailures.localError(String error) {
    return CmsBannerFailures(
      message: error,
    );
  }
}
