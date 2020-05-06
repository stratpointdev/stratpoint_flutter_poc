class CmsBannerFailure {
  CmsBannerFailure({this.code, this.message});
  factory CmsBannerFailure.fromJson(Map<String, dynamic> json) {
    return CmsBannerFailure(
        code: json['code'] as int, message: json['message'] as String);
  }

  factory CmsBannerFailure.localError(String error) {
    return CmsBannerFailure(
      message: error,
    );
  }
  int code;
  String message;
}
