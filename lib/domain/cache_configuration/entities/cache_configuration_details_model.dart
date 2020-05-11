/// This entity represents the cache configuration response from
/// Firestore.
class CacheConfigurationDetailsModel {
  CacheConfigurationDetailsModel(this.interval, this.type);

  factory CacheConfigurationDetailsModel.fromJson(Map<dynamic, dynamic> json) {
    return CacheConfigurationDetailsModel(
        int.parse(json['interval'].toString().split('.')[0]),
        json['type'].toString());
  }

  int interval;
  String type;
}
