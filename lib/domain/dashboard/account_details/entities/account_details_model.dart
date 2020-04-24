class AccountDetailsModel {
  String responseCode;
  List<DetailsByMsisdnError> accountDetailsErrors;
  DetailsByMsisdnResponse detailsByMsisdnResponse;
  AccountDetailsModel(this.responseCode, this.detailsByMsisdnResponse);

  factory AccountDetailsModel.fromJson(Map<dynamic, dynamic> json) {
    return AccountDetailsModel(json["responseCode"].toString(),
        DetailsByMsisdnResponse.fromJson(json["detailsByMsisdnResponse"]));
  }
}

class DetailsByMsisdnError {}

class DetailsByMsisdnResponse {
  DetailsByMsisdnResult detailsByMsisdnResult;
  DetailsByMsisdnResponse(this.detailsByMsisdnResult);
  factory DetailsByMsisdnResponse.fromJson(Map<dynamic, dynamic> json) {
    return DetailsByMsisdnResponse(
        DetailsByMsisdnResult.fromJson(json["detailsByMsisdnResult"]));
  }
}

class DetailsByMsisdnResult {
  SubscriberHeader subscriberHeader;
  DetailsByMsisdnResult(this.subscriberHeader);
  factory DetailsByMsisdnResult.fromJson(Map<dynamic, dynamic> json) {
    return DetailsByMsisdnResult(
        SubscriberHeader.fromJson(json["subscriberHeader"]));
  }
}

class SubscriberHeader {
  NameInfo nameInfo;
  SubscriberHeader(this.nameInfo);
  factory SubscriberHeader.fromJson(Map<dynamic, dynamic> json) {
    return SubscriberHeader(NameInfo.fromJson(json["nameInfo"]));
  }
}

class NameInfo {
  int effectiveDate;
  String expirationDate;
  int linkType;
  String nameElement1;
  String nameElement2;
  String nameElement3;
  String nameElement4;
  String nameElement5;
  String nameElement6;
  String nameElement7;
  String nameElement8;
  String nameElement9;
  String nameElement10;
  String nameLine1;
  String nameLine2;
  int nameType;
  int nameUpdateType;

  NameInfo(
      this.effectiveDate,
      this.expirationDate,
      this.linkType,
      this.nameElement1,
      this.nameElement2,
      this.nameElement3,
      this.nameElement4,
      this.nameElement5,
      this.nameElement6,
      this.nameElement7,
      this.nameElement8,
      this.nameElement9,
      this.nameElement10,
      this.nameLine1,
      this.nameLine2,
      this.nameType,
      this.nameUpdateType);

  factory NameInfo.fromJson(Map<dynamic, dynamic> json) {
    return NameInfo(
      json['effectiveDate'],
      json['expirationDate'].toString(),
      json['linkType'],
      json['nameElement1'].toString(),
      json['nameElement2'].toString(),
      json['nameElement3'].toString(),
      json['nameElement4'].toString(),
      json['nameElement5'].toString(),
      json['nameElement6'].toString(),
      json['nameElement7'].toString(),
      json['nameElement8'].toString(),
      json['nameElement9'].toString(),
      json['nameElement10'].toString(),
      json['nameLine1'].toString(),
      json['nameLine2'].toString(),
      json['nameType'],
      json['nameUpdateType'],
    );
  }
}
