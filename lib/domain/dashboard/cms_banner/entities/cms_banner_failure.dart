class CmsBannerFailure {
  CmsBannerFailure({this.code, this.message});
  factory CmsBannerFailure.fromJson(Map<String, dynamic> json) {
    return CmsBannerFailure(code: json['code'], message: json['message']);
  }

  factory CmsBannerFailure.localError(String error) {
    return CmsBannerFailure(
      message: error,
    );
  }
  int code;
  String message;
}
