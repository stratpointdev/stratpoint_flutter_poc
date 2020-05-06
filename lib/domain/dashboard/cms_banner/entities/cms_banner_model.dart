class CmsBannerModel {
  CmsBannerModel({this.cms});

  factory CmsBannerModel.fromJson(Map<String, dynamic> json) {
    print("last: ${json['jcr:lastModifiedBy']}");
    return CmsBannerModel(cms: json);
  }

  Map<String, dynamic> cms;

  Map<String, String> getImagePaths() {
    final Map<String, String> paths = <String, String>{};

    cms.forEach((String key, dynamic value) {
      if (key.contains('imagePathMobile')) {
        paths.putIfAbsent(key, () => value as String);
      }
    });
    return paths;
  }

  Map<String, String> getImageLinks() {
    final Map<String, String> paths = <String, String>{};

    cms.forEach((String key, dynamic value) {
      if (key.contains('link')) {
        paths.putIfAbsent(key, () => value as String);
      }
    });
    return paths;
  }

  Map<String, dynamic> toJson() {
    return cms;
  }
}
