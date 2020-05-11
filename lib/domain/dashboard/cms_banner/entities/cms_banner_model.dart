/// This entity contains all of the objects
/// needed for parsing the response of the
/// CMS Banner API.
class CmsBannerModel {
  CmsBannerModel({this.cms});

  factory CmsBannerModel.fromJson(Map<String, dynamic> json) {
    print("last: ${json['jcr:lastModifiedBy']}");
    return CmsBannerModel(
      cms: json,
    );
  }

  Map<String, dynamic> cms;

  String getCmsUsername() {
    return cms['cmsUsername'].toString();
  }

  String getCmsPassword() {
    return cms['cmsPassword'].toString();
  }

  String getCmsBaseUrl() {
    return cms['cmsBaseUrl'].toString();
  }

  Map<String, String> getImagePaths() {
    final Map<String, String> paths = <String, String>{};

    cms.forEach((String key, dynamic value) {
      if (key.contains('imagePathMobile')) {
        paths.putIfAbsent(key, () => value as String);
      }
    });
    return paths;
  }

  Map<String, String> getImagePathsForWeb() {
    final Map<String, String> paths = <String, String>{};

    cms.forEach((String key, dynamic value) {
      if (key.contains('imagePathWeb')) {
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
