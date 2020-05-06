class AccountDetailsModel {
  AccountDetailsModel(this.responseCode, this.detailsByMsisdnResponse);

  factory AccountDetailsModel.fromJson(Map<dynamic, dynamic> json) {
    return AccountDetailsModel(json['responseCode'] as int,
        DetailsByMsisdnResponse.fromJson(json['detailsByMsisdnResponse']));
  }

  int responseCode;
  List<DetailsByMsisdnError> accountDetailsErrors;
  DetailsByMsisdnResponse detailsByMsisdnResponse;

  Map<String, dynamic> toJson() {
    return {
      'detailsByMsisdnResponse': detailsByMsisdnResponse.toJson(),
    };
  }
}

class DetailsByMsisdnError {}

class DetailsByMsisdnResponse {
  DetailsByMsisdnResponse(this.detailsByMsisdnResult);

  factory DetailsByMsisdnResponse.fromJson(Map<dynamic, dynamic> json) {
    return DetailsByMsisdnResponse(
        DetailsByMsisdnResult.fromJson(json['detailsByMsisdnResult']));
  }

  DetailsByMsisdnResult detailsByMsisdnResult;

  Map<String, dynamic> toJson() {
    return {
      'detailsByMsisdnResult': detailsByMsisdnResult.toJson(),
    };
  }
}

class DetailsByMsisdnResult {
  DetailsByMsisdnResult(this.subscriberHeader);

  factory DetailsByMsisdnResult.fromJson(Map<dynamic, dynamic> json) {
    return DetailsByMsisdnResult(
        SubscriberHeader.fromJson(json['subscriberHeader']));
  }

  SubscriberHeader subscriberHeader;

  Map<String, dynamic> toJson() {
    return {
      'subscriberHeader': subscriberHeader.toJson(),
    };
  }
}

class SubscriberHeader {
  SubscriberHeader(this.nameInfo);

  factory SubscriberHeader.fromJson(Map<dynamic, dynamic> json) {
    return SubscriberHeader(NameInfo.fromJson(json['nameInfo']));
  }

  NameInfo nameInfo;

  Map<String, dynamic> toJson() {
    return {
      'nameInfo': nameInfo.toJson(),
    };
  }
}

class NameInfo {
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

  Map<String, dynamic> toJson() {
    return {
      'effectiveDate': effectiveDate,
      'expirationDate': expirationDate,
      'linkType': linkType,
      'nameElement1': nameElement1,
      'nameElement2': nameElement2,
      'nameElement3': nameElement3,
      'nameElement4': nameElement4,
      'nameElement5': nameElement5,
      'nameElement6': nameElement6,
      'nameElement7': nameElement7,
      'nameElement8': nameElement8,
      'nameElement9': nameElement9,
      'nameElement10': nameElement10,
      'nameLine1': nameLine1,
      'nameLine2': nameLine2,
      'nameType': nameType,
      'nameUpdateType': nameUpdateType,
    };
  }
}
