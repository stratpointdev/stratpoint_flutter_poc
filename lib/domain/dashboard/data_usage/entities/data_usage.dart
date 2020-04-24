class DataUsage{
  String startDate;
  String endDate;
  String state;
  String volumeRemaining;
  String totalAllocated;
  String volumeUsed;
  String unit;

  DataUsage({
    this.startDate,
    this.endDate,
    this.state,
    this.volumeRemaining,
    this.totalAllocated,
    this.volumeUsed,
    this.unit
  });


  factory DataUsage.fromJson(Map<String, dynamic> json) {

    return DataUsage(
        startDate : json['startDate'],
        endDate :json['endDate'],
        state: json['state'],
        volumeRemaining: json['volumeRemaining'],
        totalAllocated: json['totalAllocated'],
        volumeUsed: json['volumeUsed'],
        unit: json['unit']
    );
  }

}