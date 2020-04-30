class CmsBannerModel {
  String jcrPrimaryType;
  String jcrCreatedBy;
  String imagePath1;
  String imagePath2;
  String imagePath3;
  String imagePath4;
  String imagePath5;
  String imagePath6;
  String imagePath7;
  String imagePath8;
  String imagePath9;
  String imagePath10;
  String jcrLastModifiedBy;
  String jcrCreated;
  String link1;
  String link2;
  String link3;
  String link4;
  String link5;
  String link6;
  String link7;
  String link8;
  String link9;
  String link10;
  String jcrLastModified;
  String slingResourceType;

  CmsBannerModel(
      {this.jcrPrimaryType,
      this.jcrCreatedBy,
      this.imagePath1,
      this.imagePath2,
      this.imagePath3,
      this.imagePath4,
      this.imagePath5,
      this.imagePath6,
      this.imagePath7,
      this.imagePath8,
      this.imagePath9,
      this.imagePath10,
      this.jcrLastModifiedBy,
      this.jcrCreated,
      this.link1,
      this.link2,
      this.link4,
      this.link5,
      this.link6,
      this.link7,
      this.link8,
      this.link9,
      this.link10,
      this.jcrLastModified,
      this.slingResourceType});

  CmsBannerModel.fromJson(Map<String, dynamic> json) {
    jcrPrimaryType = json['jcr:primaryType'];
    jcrCreatedBy = json['jcr:createdBy'];
    imagePath1 = json['imagePath1'];
    imagePath2 = json['imagePath2'];
    imagePath3 = json['imagePath3'];
    imagePath4 = json['imagePath4'];
    imagePath5 = json['imagePath5'];
    imagePath6 = json['imagePath6'];
    imagePath7 = json['imagePath7'];
    imagePath8 = json['imagePath8'];
    imagePath9 = json['imagePath9'];
    imagePath10 = json['imagePath10'];
    jcrLastModifiedBy = json['jcr:lastModifiedBy'];
    jcrCreated = json['jcr:created'];
    link1 = json['link1'];
    link2 = json['link2'];
    link3 = json['link3'];
    link4 = json['link4'];
    link5 = json['link5'];
    link6 = json['link6'];
    link7 = json['link7'];
    link8 = json['link8'];
    link9 = json['link9'];
    link10 = json['link10'];
    jcrLastModified = json['jcr:lastModified'];
    slingResourceType = json['sling:resourceType'];
  }

  List<String> getImagePaths() {
    List<String> paths = [];
    if (imagePath1 != null) {
      paths.add(imagePath1);
    }
    if (imagePath2 != null) {
      paths.add(imagePath2);
    }
    if (imagePath3 != null) {
      paths.add(imagePath3);
    }
    if (imagePath4 != null) {
      paths.add(imagePath4);
    }
    if (imagePath5 != null) {
      paths.add(imagePath5);
    }
    if (imagePath6 != null) {
      paths.add(imagePath6);
    }
    if (imagePath7 != null) {
      paths.add(imagePath7);
    }
    if (imagePath8 != null) {
      paths.add(imagePath8);
    }
    if (imagePath9 != null) {
      paths.add(imagePath9);
    }
    if (imagePath10 != null) {
      paths.add(imagePath10);
    }

    return paths;
  }

  List<String> getImageLinks() {
    List<String> links = [];
    if (link1 != null) {
      links.add(link1);
    }
    if (link2 != null) {
      links.add(link2);
    }
    if (link3 != null) {
      links.add(link3);
    }
    if (link4 != null) {
      links.add(link4);
    }
    if (link5 != null) {
      links.add(link5);
    }
    if (link6 != null) {
      links.add(link6);
    }
    if (link7 != null) {
      links.add(link7);
    }
    if (link8 != null) {
      links.add(link8);
    }
    if (link9 != null) {
      links.add(link9);
    }
    if (link10 != null) {
      links.add(link10);
    }

    return links;
  }
}
