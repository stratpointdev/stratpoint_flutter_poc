class CmsBannerModel {
  CmsBannerModel({this.cms});

  CmsBannerModel.fromJson(Map<String, dynamic> json) {
    print('last: ' + json['jcr:lastModifiedBy']);
    cms = json;
  }
  Map<String, dynamic> cms;
  Map<String, String> getImagePaths() {
    final Map<String, String> paths = {};

    cms.forEach((key, value) {
      if (key.contains('imagePathMobile')) {
        paths.putIfAbsent(key, () => value);
      }
    });
    return paths;
  }

  Map<String, String> getImageLinks() {
    final Map<String, String> paths = {};

    cms.forEach((key, value) {
      if (key.contains('link')) {
        paths.putIfAbsent(key, () => value);
      }
    });
    return paths;
  }

  Map<String, dynamic> toJson() {
    return cms;
  }
}
