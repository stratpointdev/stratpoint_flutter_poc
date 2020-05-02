class CmsBannerModel {
  Map<String, dynamic> cms;

  CmsBannerModel({this.cms});

  CmsBannerModel.fromJson(Map<String, dynamic> json) {
    print('last: ' + json['jcr:lastModifiedBy']);
    cms = json;
  }

  Map<String, String> getImagePaths() {
    Map<String, String> paths = {};

    cms.forEach((key, value) {
      if (key.contains('imagePathMobile')) {
        paths.putIfAbsent(key, () => value);
      }
    });
    return paths;
  }

  Map<String, String> getImageLinks() {
    Map<String, String> paths = {};

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
