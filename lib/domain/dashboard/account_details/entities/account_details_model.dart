class AccountDetailsModel {
  AccountDetailsModel(this.responseCode, this.detailsByMsisdnResponse);

  factory AccountDetailsModel.fromJson(Map<dynamic, dynamic> json) {
    return AccountDetailsModel(
        json['responseCode'] as int,
        DetailsByMsisdnResponse.fromJson(
            json['detailsByMsisdnResponse'] as Map<dynamic, dynamic>));
  }

  int responseCode;
  List<DetailsByMsisdnError> accountDetailsErrors;
  DetailsByMsisdnResponse detailsByMsisdnResponse;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'detailsByMsisdnResponse': detailsByMsisdnResponse.toJson(),
    };
  }
}

class DetailsByMsisdnError {}

class DetailsByMsisdnResponse {
  DetailsByMsisdnResponse(this.detailsByMsisdnResult);

  factory DetailsByMsisdnResponse.fromJson(Map<dynamic, dynamic> json) {
    return DetailsByMsisdnResponse(DetailsByMsisdnResult.fromJson(
        json['detailsByMsisdnResult'] as Map<dynamic, dynamic>));
  }

  DetailsByMsisdnResult detailsByMsisdnResult;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'detailsByMsisdnResult': detailsByMsisdnResult.toJson(),
    };
  }
}

class DetailsByMsisdnResult {
  DetailsByMsisdnResult(this.subscriberHeader);

  factory DetailsByMsisdnResult.fromJson(Map<dynamic, dynamic> json) {
    return DetailsByMsisdnResult(SubscriberHeader.fromJson(
        json['subscriberHeader'] as Map<dynamic, dynamic>));
  }

  SubscriberHeader subscriberHeader;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'subscriberHeader': subscriberHeader.toJson(),
    };
  }
}

class SubscriberHeader {
  SubscriberHeader(this.nameInfo, this.subscriberGeneralInfo);

  factory SubscriberHeader.fromJson(Map<dynamic, dynamic> json) {
    return SubscriberHeader(
        NameInfo.fromJson(json['nameInfo'] as Map<dynamic, dynamic>),
        SubscriberGeneralInfo.fromJson(
            json['subscriberGeneralInfo'] as Map<dynamic, dynamic>));
  }

  NameInfo nameInfo;
  SubscriberGeneralInfo subscriberGeneralInfo;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'nameInfo': nameInfo.toJson(),
      'subscriberGeneralInfo': subscriberGeneralInfo.toJson()
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
      json['effectiveDate'] as int,
      json['expirationDate'].toString(),
      json['linkType'] as int,
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
      json['nameType'] as int,
      json['nameUpdateType'] as int,
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
    return <String, dynamic>{
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

class SubscriberGeneralInfo {
  SubscriberGeneralInfo({this.primResourceVal});

  factory SubscriberGeneralInfo.fromJson(Map<dynamic, dynamic> json) {
    return SubscriberGeneralInfo(
      primResourceVal: json['primResourceVal'] as String,
    );
  }
  String primResourceVal;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'primResourceVal': primResourceVal,
    };
  }
}
