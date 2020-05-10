class AccountDetailsRequestBody {
  AccountDetailsRequestBody(
      {this.msisdn, this.forceRefresh, this.primaryResourceType});
  String msisdn;
  bool forceRefresh;
  String primaryResourceType;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'msisdn': msisdn,
      'forceRefresh': forceRefresh,
      'primaryResourceType': primaryResourceType,
    };
  }
}