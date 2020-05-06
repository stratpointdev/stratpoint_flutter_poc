class DataUsageModel {
  DataUsageModel({this.responseCode, this.retrieveSubscriberUsageResult});

  factory DataUsageModel.fromJson(Map<String, dynamic> json) {
    print('retrieveSubscriberUsageResult ' + json.toString());
    return DataUsageModel(
      responseCode: json['responseCode'] as int,
      retrieveSubscriberUsageResult: RetrieveSubscriberUsageResult.fromJson(
          json['retrieveSubscriberUsageResult'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    print(retrieveSubscriberUsageResult.toJson().toString());
    return <String, dynamic>{
      'retrieveSubscriberUsageResult': retrieveSubscriberUsageResult.toJson(),
    };
  }

  int responseCode;
  List<BalanceByMsisdnError> errors;
  RetrieveSubscriberUsageResult retrieveSubscriberUsageResult;
}

class BalanceByMsisdnError {}

class RetrieveSubscriberUsageResult {
  RetrieveSubscriberUsageResult({this.buckets});

  factory RetrieveSubscriberUsageResult.fromJson(Map<String, dynamic> json) {
    return RetrieveSubscriberUsageResult(
      buckets: Buckets.fromJson(json['buckets'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    print('Buckets');
    return <String, dynamic>{
      'buckets': buckets.toJson(),
    };
  }

  Buckets buckets;
}

class Buckets {
  Buckets({this.dataUsageList});

  factory Buckets.fromJson(Map<String, dynamic> json) {
    return Buckets(
        dataUsageList: (json['buckets'] as List<dynamic>)
            .map((dynamic e) => DataUsage.fromJson(e as Map<String, dynamic>))
            .toList());
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'buckets': dataUsageList
          .map((DataUsage dataUsage) => dataUsage.toJson())
          .toList(),
    };
  }

  List<DataUsage> dataUsageList;
}

class DataUsage {
  DataUsage({
    this.bucketId,
    this.startDate,
    this.endDate,
    this.state,
    this.volumeRemaining,
    this.totalAllocated,
    this.volumeUsed,
    this.unit,
  });

  factory DataUsage.fromJson(Map<String, dynamic> json) {
    print('DataUsage' + json['bucketId'].toString());
    return DataUsage(
        bucketId: json['bucketId'] as String,
        startDate: json['startDate'] as String,
        endDate: json['endDate'] as String,
        state: json['state'] as String,
        volumeRemaining: json['volumeRemaining'] as String,
        totalAllocated: json['totalAllocated'] as String,
        volumeUsed: json['volumeUsed'] as String,
        unit: json['unit'] as String);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'bucketId': bucketId,
      'startDate': startDate,
      'endDate': endDate,
      'state': state,
      'volumeRemaining': volumeRemaining,
      'totalAllocated': totalAllocated,
      'volumeUsed': volumeUsed,
      'unit': unit,
    };
  }

  final String bucketId;
  final String startDate;
  final String endDate;
  final String state;
  final String volumeRemaining;
  final String totalAllocated;
  final String volumeUsed;
  final String unit;
}
