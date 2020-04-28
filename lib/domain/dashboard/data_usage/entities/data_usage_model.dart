
class DataUsageModel{
  int responseCode;
  List<BalanceByMsisdnError> errors;
  RetrieveSubscriberUsageResult retrieveSubscriberUsageResult;
  DataUsageModel({this.responseCode,this.retrieveSubscriberUsageResult});

  factory DataUsageModel.fromJson(Map<String, dynamic> json) {
    print('retrieveSubscriberUsageResult ' + json.toString());
    return DataUsageModel(responseCode:  json["responseCode"],
      retrieveSubscriberUsageResult: RetrieveSubscriberUsageResult.fromJson(json['retrieveSubscriberUsageResult']),
    );
  }

  Map<String, dynamic> toJson() {
    print(retrieveSubscriberUsageResult.toJson().toString());
    return {
      'retrieveSubscriberUsageResult': retrieveSubscriberUsageResult.toJson(),
    };
  }
}

class BalanceByMsisdnError {
}


class RetrieveSubscriberUsageResult{
  Buckets buckets;
  RetrieveSubscriberUsageResult({this.buckets});

  factory RetrieveSubscriberUsageResult.fromJson(Map<String, dynamic> json) {

    return RetrieveSubscriberUsageResult(
      buckets: Buckets.fromJson(json['buckets']),
    );
  }

  Map<String, dynamic> toJson() {
    print('Buckets');
    return {
      'buckets': buckets.toJson(),
    };
  }

}


class Buckets {
  List<DataUsage> dataUsageList;
  Buckets({this.dataUsageList});

   factory Buckets.fromJson(Map<String,dynamic> json) {
     return Buckets(dataUsageList: (json['buckets'] as List).map((e) => DataUsage.fromJson(e as Map<String, dynamic>)).toList());
  }

  Map<String,dynamic> toJson() {
    return {
      'buckets': dataUsageList.map((dataUsage) => dataUsage.toJson()).toList(),
    };
  }
}


class DataUsage {

  final String bucketId;
  final String startDate;
  final String endDate;
  final String state;
  final String volumeRemaining;
  final String totalAllocated;
  final String volumeUsed;
  final String unit;

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
  print('DataUsage'+ json['bucketId'].toString());
    return DataUsage(
        bucketId: json['bucketId'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        state: json['state'],
        volumeRemaining: json['volumeRemaining'],
        totalAllocated: json['totalAllocated'],
        volumeUsed: json['volumeUsed'],
        unit: json['unit']
    );
  }

 Map<String, dynamic> toJson() {
    return {
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




}




