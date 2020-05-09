class DataUsageRequestBody {
  DataUsageRequestBody(
      {this.serviceNumber, this.forceRefresh, this.primaryResourceType});
  String serviceNumber;
  bool forceRefresh;
  String primaryResourceType;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'serviceNumber': serviceNumber,
      'forceRefresh': forceRefresh,
      'primaryResourceType': primaryResourceType,
    };
  }
}
