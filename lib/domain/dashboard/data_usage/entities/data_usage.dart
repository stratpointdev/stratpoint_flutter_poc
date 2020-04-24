

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
    this.unit
  });


  factory DataUsage.fromMap(Map<String, dynamic> json) {

    return DataUsage(
        bucketId: json['bucketId'],
        startDate : json['startDate'],
        endDate :json['endDate'],
        state: json['state'],
        volumeRemaining: json['volumeRemaining'],
        totalAllocated: json['totalAllocated'],
        volumeUsed: json['volumeUsed'],
        unit: json['unit']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bucketId' : bucketId,
      'startDate' : startDate,
      'endDate' : endDate,
      'state' : state,
      'volumeRemaining' :volumeRemaining,
      'totalAllocated' : totalAllocated,
      'volumeUsed' :volumeUsed,
      'unit' :unit,
    };


  }


}