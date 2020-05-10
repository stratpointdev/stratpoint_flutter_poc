class CacheConfigurationDetailsModel {
  CacheConfigurationDetailsModel(this.interval, this.type);

  factory CacheConfigurationDetailsModel.fromJson(Map<dynamic, dynamic> json) {
    return CacheConfigurationDetailsModel(
        int.parse(json['interval'].toString()), json['type'].toString());
  }

  int interval;
  String type;
}
